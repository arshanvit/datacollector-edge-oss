package mqtt

import (
	"github.com/streamsets/datacollector-edge/container/common"
	"github.com/streamsets/datacollector-edge/container/creation"
	"testing"
)

func getStageContext(
	brokerUrl string,
	clientId string,
	qos float64,
	topic string,
	dataFormat string,
	parameters map[string]interface{},
) *common.StageContextImpl {
	stageConfig := common.StageConfiguration{}
	stageConfig.Library = LIBRARY
	stageConfig.StageName = STAGE_NAME
	stageConfig.Configuration = []common.Config{
		{
			Name:  "commonConf.brokerUrl",
			Value: brokerUrl,
		},
		{
			Name:  "commonConf.clientId",
			Value: clientId,
		},
		{
			Name:  "commonConf.qos",
			Value: qos,
		},
		{
			Name:  "publisherConf.topic",
			Value: topic,
		},
		{
			Name:  "publisherConf.dataFormat",
			Value: dataFormat,
		},
	}
	return &common.StageContextImpl{
		StageConfig: stageConfig,
		Parameters:  parameters,
	}
}

func TestHttpClientDestination_Init(t *testing.T) {
	brokerUrl := "http://test:9000"
	clientId := "clientId"
	qos := float64(1)
	topic := "Sample/Topic"
	dataFormat := "JSON"

	stageContext := getStageContext(brokerUrl, clientId, qos, topic, dataFormat, nil)
	stageBean, err := creation.NewStageBean(stageContext.StageConfig, stageContext.Parameters)
	if err != nil {
		t.Error(err)
		return
	}

	stageInstance := stageBean.Stage
	if stageInstance == nil {
		t.Error("Failed to create stage instance")
	}

	if stageInstance.(*MqttClientDestination).CommonConf.BrokerUrl != brokerUrl {
		t.Error("Failed to inject config value for brokerUrl")
	}

	if stageInstance.(*MqttClientDestination).CommonConf.ClientId != clientId {
		t.Error("Failed to inject config value for clientId")
	}

	if stageInstance.(*MqttClientDestination).CommonConf.Qos != qos {
		t.Error("Failed to inject config value for qos")
	}

	if stageInstance.(*MqttClientDestination).PublisherConf.Topic != topic {
		t.Error("Failed to inject config value for topic")
	}

	if stageInstance.(*MqttClientDestination).PublisherConf.DataFormat != dataFormat {
		t.Error("Failed to inject config value for dataFormat")
	}
}
