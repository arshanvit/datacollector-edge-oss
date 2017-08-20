package filetail

import (
	"github.com/streamsets/datacollector-edge/api"
	"github.com/streamsets/datacollector-edge/container/common"
	"github.com/streamsets/datacollector-edge/container/execution/runner"
	"github.com/streamsets/datacollector-edge/stages/stagelibrary"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"testing"
)

func getStageContext(filePath string, maxWaitTimeSecs float64) api.StageContext {
	stageConfig := common.StageConfiguration{}
	stageConfig.Library = LIBRARY
	stageConfig.StageName = STAGE_NAME
	stageConfig.Configuration = make([]common.Config, 2)

	fileInfoSlice := make([]interface{}, 1, 1)
	fileInfoSlice[0] = map[string]interface{}{
		"fileFullPath": filePath,
	}

	stageConfig.Configuration[0] = common.Config{
		Name:  CONF_FILE_INFOS,
		Value: fileInfoSlice,
	}
	stageConfig.Configuration[1] = common.Config{
		Name:  CONF_MAX_WAIT_TIME_SECS,
		Value: maxWaitTimeSecs,
	}

	return &common.StageContextImpl{
		StageConfig: stageConfig,
		Parameters:  nil,
	}
}

func TestInvalidFilePath(t *testing.T) {
	stageContext := getStageContext("/no/such/file", 2)
	stageInstance, err := stagelibrary.CreateStageInstance(LIBRARY, STAGE_NAME)
	if err != nil {
		t.Error(err)
	}
	err = stageInstance.Init(stageContext)
	if err != nil {
		t.Error(err)
	}

	batchMaker := runner.NewBatchMakerImpl(runner.StagePipe{})
	_, err = stageInstance.(api.Origin).Produce("", 1000, batchMaker)
	if err == nil {
		t.Error("Excepted error message for invalid URL")
	}
	log.Println("err - ", err)
	stageInstance.Destroy()
}

func TestValidFilePath(t *testing.T) {
	content := []byte("test data 1\ntest data 2\ntest data 3\ntest data 4\n")
	dir, err := ioutil.TempDir("", "TestValidFilePath")
	if err != nil {
		t.Fatal(err)
	}

	defer os.RemoveAll(dir) // clean up

	filePath := filepath.Join(dir, "tmpFile.log")
	if err := ioutil.WriteFile(filePath, content, 0666); err != nil {
		t.Fatal(err)
	}

	stageContext := getStageContext(filePath, 2)
	stageInstance, err := stagelibrary.CreateStageInstance(LIBRARY, STAGE_NAME)
	if err != nil {
		t.Error(err)
	}
	err = stageInstance.Init(stageContext)
	if err != nil {
		t.Error(err)
	}

	batchMaker := runner.NewBatchMakerImpl(runner.StagePipe{})
	lastSourceOffset, err := stageInstance.(api.Origin).Produce("", 1000, batchMaker)
	if err != nil {
		t.Error("Err :", err)
	}

	if lastSourceOffset == "" {
		t.Error("No offset returned :")
	}
	log.Println("offset - " + lastSourceOffset)

	records := batchMaker.GetStageOutput()
	if len(records) != 4 {
		t.Error("Excepted 4 records but got - ", len(records))
	}

	if records[0].Get().Value != "test data 1" {
		t.Error("Excepted 'test data 1' but got - ", records[0].Get().Value)
	}

	// With maxBatchSize 2 - batch 1
	batchMaker = runner.NewBatchMakerImpl(runner.StagePipe{})
	lastSourceOffset, err = stageInstance.(api.Origin).Produce("", 2, batchMaker)
	if err != nil {
		t.Error("Err :", err)
	}

	records = batchMaker.GetStageOutput()
	if len(records) != 2 {
		t.Error("Excepted 2 records but got - ", len(records))
	}

	if records[0].Get().Value != "test data 1" {
		t.Error("Excepted 'test data 1' but got - ", records[0].Get().Value)
	}

	// With maxBatchSize 2 - batch 2
	batchMaker = runner.NewBatchMakerImpl(runner.StagePipe{})
	lastSourceOffset, err = stageInstance.(api.Origin).Produce(lastSourceOffset, 2, batchMaker)
	if err != nil {
		t.Error("Err :", err)
	}

	records = batchMaker.GetStageOutput()
	if len(records) != 2 {
		t.Error("Excepted 2 records but got - ", len(records))
	}

	if records[0].Get().Value != "test data 3" {
		t.Error("Excepted 'test data 3' but got - ", records[0].Get().Value)
	}

	stageInstance.Destroy()
}

func _TestChannelDeadlockIssue(t *testing.T) {
	filePath1 := "/Users/sds.log"

	stageContext := getStageContext(filePath1, 2)
	stageInstance, err := stagelibrary.CreateStageInstance(LIBRARY, STAGE_NAME)
	if err != nil {
		t.Error(err)
	}
	err = stageInstance.Init(stageContext)
	if err != nil {
		t.Error(err)
	}

	batchMaker := runner.NewBatchMakerImpl(runner.StagePipe{})
	lastSourceOffset, err := stageInstance.(api.Origin).Produce("", 1000, batchMaker)
	log.Println("offset - " + lastSourceOffset)

	lastSourceOffset, err = stageInstance.(api.Origin).Produce(lastSourceOffset, 1000, batchMaker)
	log.Println("offset - " + lastSourceOffset)

	lastSourceOffset, err = stageInstance.(api.Origin).Produce(lastSourceOffset, 1000, batchMaker)
	log.Println("offset - " + lastSourceOffset)

	for true {
		lastSourceOffset, err = stageInstance.(api.Origin).Produce(lastSourceOffset, 1000, batchMaker)
		log.Println("offset - " + lastSourceOffset)
	}

	stageInstance.Destroy()
}
