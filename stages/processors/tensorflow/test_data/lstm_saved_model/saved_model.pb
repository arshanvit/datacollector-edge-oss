ł
Ť
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:

RandomStandardNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
-
Tanh
x"T
y"T"
Ttype:

2
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.9.02v1.9.0-0-g25c197e0238÷

global_step/Initializer/zerosConst*
_output_shapes
: *
value	B	 R *
_class
loc:@global_step*
dtype0	
k
global_step
VariableV2*
_class
loc:@global_step*
shape: *
dtype0	*
_output_shapes
: 

global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
_output_shapes
: *
T0	*
_class
loc:@global_step
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 
n
PlaceholderPlaceholder*
dtype0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
shape:˙˙˙˙˙˙˙˙˙
Y
ExpandDims/dimConst*
valueB :
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
: 
k

ExpandDims
ExpandDimsPlaceholderExpandDims/dim*+
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
j

timeseriesSqueeze
ExpandDims*
squeeze_dims
*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
G
ConstConst*
value	B :*
dtype0*
_output_shapes
: 
Q
split/split_dimConst*
value	B :*
dtype0*
_output_shapes
: 
ö
splitSplitsplit/split_dim
timeseries*
T0*
	num_split*Ž
_output_shapes
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
>
	rnn/ShapeShapesplit*
_output_shapes
:*
T0
a
rnn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
c
rnn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
c
rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Á
rnn/strided_sliceStridedSlice	rnn/Shapernn/strided_slice/stackrnn/strided_slice/stack_1rnn/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*
_output_shapes
: 
k
)rnn/BasicLSTMCellZeroState/ExpandDims/dimConst*
value	B : *
dtype0*
_output_shapes
: 

%rnn/BasicLSTMCellZeroState/ExpandDims
ExpandDimsrnn/strided_slice)rnn/BasicLSTMCellZeroState/ExpandDims/dim*
T0*
_output_shapes
:
j
 rnn/BasicLSTMCellZeroState/ConstConst*
valueB:*
dtype0*
_output_shapes
:
h
&rnn/BasicLSTMCellZeroState/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
Ě
!rnn/BasicLSTMCellZeroState/concatConcatV2%rnn/BasicLSTMCellZeroState/ExpandDims rnn/BasicLSTMCellZeroState/Const&rnn/BasicLSTMCellZeroState/concat/axis*
T0*
N*
_output_shapes
:
k
&rnn/BasicLSTMCellZeroState/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
Ľ
 rnn/BasicLSTMCellZeroState/zerosFill!rnn/BasicLSTMCellZeroState/concat&rnn/BasicLSTMCellZeroState/zeros/Const*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
m
+rnn/BasicLSTMCellZeroState/ExpandDims_1/dimConst*
value	B : *
dtype0*
_output_shapes
: 

'rnn/BasicLSTMCellZeroState/ExpandDims_1
ExpandDimsrnn/strided_slice+rnn/BasicLSTMCellZeroState/ExpandDims_1/dim*
_output_shapes
:*
T0
l
"rnn/BasicLSTMCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
m
+rnn/BasicLSTMCellZeroState/ExpandDims_2/dimConst*
value	B : *
dtype0*
_output_shapes
: 

'rnn/BasicLSTMCellZeroState/ExpandDims_2
ExpandDimsrnn/strided_slice+rnn/BasicLSTMCellZeroState/ExpandDims_2/dim*
_output_shapes
:*
T0
l
"rnn/BasicLSTMCellZeroState/Const_2Const*
valueB:*
dtype0*
_output_shapes
:
j
(rnn/BasicLSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ô
#rnn/BasicLSTMCellZeroState/concat_1ConcatV2'rnn/BasicLSTMCellZeroState/ExpandDims_2"rnn/BasicLSTMCellZeroState/Const_2(rnn/BasicLSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:
m
(rnn/BasicLSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ť
"rnn/BasicLSTMCellZeroState/zeros_1Fill#rnn/BasicLSTMCellZeroState/concat_1(rnn/BasicLSTMCellZeroState/zeros_1/Const*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
m
+rnn/BasicLSTMCellZeroState/ExpandDims_3/dimConst*
value	B : *
dtype0*
_output_shapes
: 

'rnn/BasicLSTMCellZeroState/ExpandDims_3
ExpandDimsrnn/strided_slice+rnn/BasicLSTMCellZeroState/ExpandDims_3/dim*
T0*
_output_shapes
:
l
"rnn/BasicLSTMCellZeroState/Const_3Const*
valueB:*
dtype0*
_output_shapes
:
ť
;rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shapeConst*
valueB"      *-
_class#
!loc:@rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
­
9rnn/basic_lstm_cell/kernel/Initializer/random_uniform/minConst*
valueB
 *qÄż*-
_class#
!loc:@rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
: 
­
9rnn/basic_lstm_cell/kernel/Initializer/random_uniform/maxConst*
valueB
 *qÄ?*-
_class#
!loc:@rnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
: 
ö
Crnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniform;rnn/basic_lstm_cell/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:*
T0*-
_class#
!loc:@rnn/basic_lstm_cell/kernel

9rnn/basic_lstm_cell/kernel/Initializer/random_uniform/subSub9rnn/basic_lstm_cell/kernel/Initializer/random_uniform/max9rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*-
_class#
!loc:@rnn/basic_lstm_cell/kernel*
_output_shapes
: *
T0

9rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mulMulCrnn/basic_lstm_cell/kernel/Initializer/random_uniform/RandomUniform9rnn/basic_lstm_cell/kernel/Initializer/random_uniform/sub*
T0*-
_class#
!loc:@rnn/basic_lstm_cell/kernel*
_output_shapes

:

5rnn/basic_lstm_cell/kernel/Initializer/random_uniformAdd9rnn/basic_lstm_cell/kernel/Initializer/random_uniform/mul9rnn/basic_lstm_cell/kernel/Initializer/random_uniform/min*-
_class#
!loc:@rnn/basic_lstm_cell/kernel*
_output_shapes

:*
T0

rnn/basic_lstm_cell/kernel
VariableV2*
shape
:*
dtype0*
_output_shapes

:*-
_class#
!loc:@rnn/basic_lstm_cell/kernel
Ö
!rnn/basic_lstm_cell/kernel/AssignAssignrnn/basic_lstm_cell/kernel5rnn/basic_lstm_cell/kernel/Initializer/random_uniform*
T0*-
_class#
!loc:@rnn/basic_lstm_cell/kernel*
_output_shapes

:
p
rnn/basic_lstm_cell/kernel/readIdentityrnn/basic_lstm_cell/kernel*
T0*
_output_shapes

:
¤
*rnn/basic_lstm_cell/bias/Initializer/zerosConst*
_output_shapes
:*
valueB*    *+
_class!
loc:@rnn/basic_lstm_cell/bias*
dtype0

rnn/basic_lstm_cell/bias
VariableV2*
shape:*
dtype0*
_output_shapes
:*+
_class!
loc:@rnn/basic_lstm_cell/bias
Á
rnn/basic_lstm_cell/bias/AssignAssignrnn/basic_lstm_cell/bias*rnn/basic_lstm_cell/bias/Initializer/zeros*+
_class!
loc:@rnn/basic_lstm_cell/bias*
_output_shapes
:*
T0
h
rnn/basic_lstm_cell/bias/readIdentityrnn/basic_lstm_cell/bias*
T0*
_output_shapes
:
[
rnn/basic_lstm_cell/ConstConst*
value	B :*
dtype0*
_output_shapes
: 
a
rnn/basic_lstm_cell/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
­
rnn/basic_lstm_cell/concatConcatV2split"rnn/BasicLSTMCellZeroState/zeros_1rnn/basic_lstm_cell/concat/axis*
T0*
N*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/MatMulMatMulrnn/basic_lstm_cell/concatrnn/basic_lstm_cell/kernel/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/BiasAddBiasAddrnn/basic_lstm_cell/MatMulrnn/basic_lstm_cell/bias/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
]
rnn/basic_lstm_cell/Const_1Const*
value	B :*
dtype0*
_output_shapes
: 
Ö
rnn/basic_lstm_cell/splitSplitrnn/basic_lstm_cell/Constrnn/basic_lstm_cell/BiasAdd*
	num_split*`
_output_shapesN
L:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0
`
rnn/basic_lstm_cell/Const_2Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 

rnn/basic_lstm_cell/AddAddrnn/basic_lstm_cell/split:2rnn/basic_lstm_cell/Const_2*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
q
rnn/basic_lstm_cell/SigmoidSigmoidrnn/basic_lstm_cell/Add*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/MulMul rnn/BasicLSTMCellZeroState/zerosrnn/basic_lstm_cell/Sigmoid*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
u
rnn/basic_lstm_cell/Sigmoid_1Sigmoidrnn/basic_lstm_cell/split*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
o
rnn/basic_lstm_cell/TanhTanhrnn/basic_lstm_cell/split:1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_1Mulrnn/basic_lstm_cell/Sigmoid_1rnn/basic_lstm_cell/Tanh*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Add_1Addrnn/basic_lstm_cell/Mulrnn/basic_lstm_cell/Mul_1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
o
rnn/basic_lstm_cell/Tanh_1Tanhrnn/basic_lstm_cell/Add_1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
w
rnn/basic_lstm_cell/Sigmoid_2Sigmoidrnn/basic_lstm_cell/split:3*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/Mul_2Mulrnn/basic_lstm_cell/Tanh_1rnn/basic_lstm_cell/Sigmoid_2*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
]
rnn/basic_lstm_cell/Const_3Const*
value	B :*
dtype0*
_output_shapes
: 
c
!rnn/basic_lstm_cell/concat_1/axisConst*
value	B :*
dtype0*
_output_shapes
: 
Ş
rnn/basic_lstm_cell/concat_1ConcatV2split:1rnn/basic_lstm_cell/Mul_2!rnn/basic_lstm_cell/concat_1/axis*
T0*
N*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/MatMul_1MatMulrnn/basic_lstm_cell/concat_1rnn/basic_lstm_cell/kernel/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/BiasAdd_1BiasAddrnn/basic_lstm_cell/MatMul_1rnn/basic_lstm_cell/bias/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
]
rnn/basic_lstm_cell/Const_4Const*
_output_shapes
: *
value	B :*
dtype0
Ü
rnn/basic_lstm_cell/split_1Splitrnn/basic_lstm_cell/Const_3rnn/basic_lstm_cell/BiasAdd_1*
T0*
	num_split*`
_output_shapesN
L:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
`
rnn/basic_lstm_cell/Const_5Const*
dtype0*
_output_shapes
: *
valueB
 *  ?

rnn/basic_lstm_cell/Add_2Addrnn/basic_lstm_cell/split_1:2rnn/basic_lstm_cell/Const_5*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
u
rnn/basic_lstm_cell/Sigmoid_3Sigmoidrnn/basic_lstm_cell/Add_2*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_3Mulrnn/basic_lstm_cell/Add_1rnn/basic_lstm_cell/Sigmoid_3*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
w
rnn/basic_lstm_cell/Sigmoid_4Sigmoidrnn/basic_lstm_cell/split_1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
s
rnn/basic_lstm_cell/Tanh_2Tanhrnn/basic_lstm_cell/split_1:1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_4Mulrnn/basic_lstm_cell/Sigmoid_4rnn/basic_lstm_cell/Tanh_2*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/Add_3Addrnn/basic_lstm_cell/Mul_3rnn/basic_lstm_cell/Mul_4*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
o
rnn/basic_lstm_cell/Tanh_3Tanhrnn/basic_lstm_cell/Add_3*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
y
rnn/basic_lstm_cell/Sigmoid_5Sigmoidrnn/basic_lstm_cell/split_1:3*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_5Mulrnn/basic_lstm_cell/Tanh_3rnn/basic_lstm_cell/Sigmoid_5*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
]
rnn/basic_lstm_cell/Const_6Const*
value	B :*
dtype0*
_output_shapes
: 
c
!rnn/basic_lstm_cell/concat_2/axisConst*
value	B :*
dtype0*
_output_shapes
: 
Ş
rnn/basic_lstm_cell/concat_2ConcatV2split:2rnn/basic_lstm_cell/Mul_5!rnn/basic_lstm_cell/concat_2/axis*
T0*
N*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/MatMul_2MatMulrnn/basic_lstm_cell/concat_2rnn/basic_lstm_cell/kernel/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/BiasAdd_2BiasAddrnn/basic_lstm_cell/MatMul_2rnn/basic_lstm_cell/bias/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
]
rnn/basic_lstm_cell/Const_7Const*
value	B :*
dtype0*
_output_shapes
: 
Ü
rnn/basic_lstm_cell/split_2Splitrnn/basic_lstm_cell/Const_6rnn/basic_lstm_cell/BiasAdd_2*
T0*
	num_split*`
_output_shapesN
L:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
`
rnn/basic_lstm_cell/Const_8Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 

rnn/basic_lstm_cell/Add_4Addrnn/basic_lstm_cell/split_2:2rnn/basic_lstm_cell/Const_8*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
u
rnn/basic_lstm_cell/Sigmoid_6Sigmoidrnn/basic_lstm_cell/Add_4*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_6Mulrnn/basic_lstm_cell/Add_3rnn/basic_lstm_cell/Sigmoid_6*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
w
rnn/basic_lstm_cell/Sigmoid_7Sigmoidrnn/basic_lstm_cell/split_2*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
s
rnn/basic_lstm_cell/Tanh_4Tanhrnn/basic_lstm_cell/split_2:1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/Mul_7Mulrnn/basic_lstm_cell/Sigmoid_7rnn/basic_lstm_cell/Tanh_4*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Add_5Addrnn/basic_lstm_cell/Mul_6rnn/basic_lstm_cell/Mul_7*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
o
rnn/basic_lstm_cell/Tanh_5Tanhrnn/basic_lstm_cell/Add_5*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
y
rnn/basic_lstm_cell/Sigmoid_8Sigmoidrnn/basic_lstm_cell/split_2:3*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/Mul_8Mulrnn/basic_lstm_cell/Tanh_5rnn/basic_lstm_cell/Sigmoid_8*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
]
rnn/basic_lstm_cell/Const_9Const*
value	B :*
dtype0*
_output_shapes
: 
c
!rnn/basic_lstm_cell/concat_3/axisConst*
dtype0*
_output_shapes
: *
value	B :
Ş
rnn/basic_lstm_cell/concat_3ConcatV2split:3rnn/basic_lstm_cell/Mul_8!rnn/basic_lstm_cell/concat_3/axis*
T0*
N*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/MatMul_3MatMulrnn/basic_lstm_cell/concat_3rnn/basic_lstm_cell/kernel/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/BiasAdd_3BiasAddrnn/basic_lstm_cell/MatMul_3rnn/basic_lstm_cell/bias/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
^
rnn/basic_lstm_cell/Const_10Const*
value	B :*
dtype0*
_output_shapes
: 
Ü
rnn/basic_lstm_cell/split_3Splitrnn/basic_lstm_cell/Const_9rnn/basic_lstm_cell/BiasAdd_3*
T0*
	num_split*`
_output_shapesN
L:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
a
rnn/basic_lstm_cell/Const_11Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 

rnn/basic_lstm_cell/Add_6Addrnn/basic_lstm_cell/split_3:2rnn/basic_lstm_cell/Const_11*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
u
rnn/basic_lstm_cell/Sigmoid_9Sigmoidrnn/basic_lstm_cell/Add_6*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_9Mulrnn/basic_lstm_cell/Add_5rnn/basic_lstm_cell/Sigmoid_9*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
x
rnn/basic_lstm_cell/Sigmoid_10Sigmoidrnn/basic_lstm_cell/split_3*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
s
rnn/basic_lstm_cell/Tanh_6Tanhrnn/basic_lstm_cell/split_3:1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_10Mulrnn/basic_lstm_cell/Sigmoid_10rnn/basic_lstm_cell/Tanh_6*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Add_7Addrnn/basic_lstm_cell/Mul_9rnn/basic_lstm_cell/Mul_10*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
o
rnn/basic_lstm_cell/Tanh_7Tanhrnn/basic_lstm_cell/Add_7*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
z
rnn/basic_lstm_cell/Sigmoid_11Sigmoidrnn/basic_lstm_cell/split_3:3*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_11Mulrnn/basic_lstm_cell/Tanh_7rnn/basic_lstm_cell/Sigmoid_11*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
^
rnn/basic_lstm_cell/Const_12Const*
_output_shapes
: *
value	B :*
dtype0
c
!rnn/basic_lstm_cell/concat_4/axisConst*
value	B :*
dtype0*
_output_shapes
: 
Ť
rnn/basic_lstm_cell/concat_4ConcatV2split:4rnn/basic_lstm_cell/Mul_11!rnn/basic_lstm_cell/concat_4/axis*
N*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/MatMul_4MatMulrnn/basic_lstm_cell/concat_4rnn/basic_lstm_cell/kernel/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/BiasAdd_4BiasAddrnn/basic_lstm_cell/MatMul_4rnn/basic_lstm_cell/bias/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
^
rnn/basic_lstm_cell/Const_13Const*
_output_shapes
: *
value	B :*
dtype0
Ý
rnn/basic_lstm_cell/split_4Splitrnn/basic_lstm_cell/Const_12rnn/basic_lstm_cell/BiasAdd_4*
T0*
	num_split*`
_output_shapesN
L:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
a
rnn/basic_lstm_cell/Const_14Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 

rnn/basic_lstm_cell/Add_8Addrnn/basic_lstm_cell/split_4:2rnn/basic_lstm_cell/Const_14*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
v
rnn/basic_lstm_cell/Sigmoid_12Sigmoidrnn/basic_lstm_cell/Add_8*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_12Mulrnn/basic_lstm_cell/Add_7rnn/basic_lstm_cell/Sigmoid_12*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
x
rnn/basic_lstm_cell/Sigmoid_13Sigmoidrnn/basic_lstm_cell/split_4*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
s
rnn/basic_lstm_cell/Tanh_8Tanhrnn/basic_lstm_cell/split_4:1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_13Mulrnn/basic_lstm_cell/Sigmoid_13rnn/basic_lstm_cell/Tanh_8*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Add_9Addrnn/basic_lstm_cell/Mul_12rnn/basic_lstm_cell/Mul_13*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
o
rnn/basic_lstm_cell/Tanh_9Tanhrnn/basic_lstm_cell/Add_9*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
z
rnn/basic_lstm_cell/Sigmoid_14Sigmoidrnn/basic_lstm_cell/split_4:3*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_14Mulrnn/basic_lstm_cell/Tanh_9rnn/basic_lstm_cell/Sigmoid_14*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
^
rnn/basic_lstm_cell/Const_15Const*
value	B :*
dtype0*
_output_shapes
: 
c
!rnn/basic_lstm_cell/concat_5/axisConst*
dtype0*
_output_shapes
: *
value	B :
Ť
rnn/basic_lstm_cell/concat_5ConcatV2split:5rnn/basic_lstm_cell/Mul_14!rnn/basic_lstm_cell/concat_5/axis*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
N

rnn/basic_lstm_cell/MatMul_5MatMulrnn/basic_lstm_cell/concat_5rnn/basic_lstm_cell/kernel/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/BiasAdd_5BiasAddrnn/basic_lstm_cell/MatMul_5rnn/basic_lstm_cell/bias/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
^
rnn/basic_lstm_cell/Const_16Const*
value	B :*
dtype0*
_output_shapes
: 
Ý
rnn/basic_lstm_cell/split_5Splitrnn/basic_lstm_cell/Const_15rnn/basic_lstm_cell/BiasAdd_5*
	num_split*`
_output_shapesN
L:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0
a
rnn/basic_lstm_cell/Const_17Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 

rnn/basic_lstm_cell/Add_10Addrnn/basic_lstm_cell/split_5:2rnn/basic_lstm_cell/Const_17*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
w
rnn/basic_lstm_cell/Sigmoid_15Sigmoidrnn/basic_lstm_cell/Add_10*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_15Mulrnn/basic_lstm_cell/Add_9rnn/basic_lstm_cell/Sigmoid_15*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
x
rnn/basic_lstm_cell/Sigmoid_16Sigmoidrnn/basic_lstm_cell/split_5*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
t
rnn/basic_lstm_cell/Tanh_10Tanhrnn/basic_lstm_cell/split_5:1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_16Mulrnn/basic_lstm_cell/Sigmoid_16rnn/basic_lstm_cell/Tanh_10*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Add_11Addrnn/basic_lstm_cell/Mul_15rnn/basic_lstm_cell/Mul_16*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
q
rnn/basic_lstm_cell/Tanh_11Tanhrnn/basic_lstm_cell/Add_11*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
z
rnn/basic_lstm_cell/Sigmoid_17Sigmoidrnn/basic_lstm_cell/split_5:3*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/Mul_17Mulrnn/basic_lstm_cell/Tanh_11rnn/basic_lstm_cell/Sigmoid_17*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
^
rnn/basic_lstm_cell/Const_18Const*
_output_shapes
: *
value	B :*
dtype0
c
!rnn/basic_lstm_cell/concat_6/axisConst*
value	B :*
dtype0*
_output_shapes
: 
Ť
rnn/basic_lstm_cell/concat_6ConcatV2split:6rnn/basic_lstm_cell/Mul_17!rnn/basic_lstm_cell/concat_6/axis*
T0*
N*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/MatMul_6MatMulrnn/basic_lstm_cell/concat_6rnn/basic_lstm_cell/kernel/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/BiasAdd_6BiasAddrnn/basic_lstm_cell/MatMul_6rnn/basic_lstm_cell/bias/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
^
rnn/basic_lstm_cell/Const_19Const*
value	B :*
dtype0*
_output_shapes
: 
Ý
rnn/basic_lstm_cell/split_6Splitrnn/basic_lstm_cell/Const_18rnn/basic_lstm_cell/BiasAdd_6*
	num_split*`
_output_shapesN
L:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0
a
rnn/basic_lstm_cell/Const_20Const*
dtype0*
_output_shapes
: *
valueB
 *  ?

rnn/basic_lstm_cell/Add_12Addrnn/basic_lstm_cell/split_6:2rnn/basic_lstm_cell/Const_20*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
w
rnn/basic_lstm_cell/Sigmoid_18Sigmoidrnn/basic_lstm_cell/Add_12*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/Mul_18Mulrnn/basic_lstm_cell/Add_11rnn/basic_lstm_cell/Sigmoid_18*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
x
rnn/basic_lstm_cell/Sigmoid_19Sigmoidrnn/basic_lstm_cell/split_6*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
t
rnn/basic_lstm_cell/Tanh_12Tanhrnn/basic_lstm_cell/split_6:1*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_19Mulrnn/basic_lstm_cell/Sigmoid_19rnn/basic_lstm_cell/Tanh_12*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/Add_13Addrnn/basic_lstm_cell/Mul_18rnn/basic_lstm_cell/Mul_19*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
q
rnn/basic_lstm_cell/Tanh_13Tanhrnn/basic_lstm_cell/Add_13*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
z
rnn/basic_lstm_cell/Sigmoid_20Sigmoidrnn/basic_lstm_cell/split_6:3*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/Mul_20Mulrnn/basic_lstm_cell/Tanh_13rnn/basic_lstm_cell/Sigmoid_20*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
^
rnn/basic_lstm_cell/Const_21Const*
value	B :*
dtype0*
_output_shapes
: 
c
!rnn/basic_lstm_cell/concat_7/axisConst*
value	B :*
dtype0*
_output_shapes
: 
Ť
rnn/basic_lstm_cell/concat_7ConcatV2split:7rnn/basic_lstm_cell/Mul_20!rnn/basic_lstm_cell/concat_7/axis*
T0*
N*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/MatMul_7MatMulrnn/basic_lstm_cell/concat_7rnn/basic_lstm_cell/kernel/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/BiasAdd_7BiasAddrnn/basic_lstm_cell/MatMul_7rnn/basic_lstm_cell/bias/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
^
rnn/basic_lstm_cell/Const_22Const*
_output_shapes
: *
value	B :*
dtype0
Ý
rnn/basic_lstm_cell/split_7Splitrnn/basic_lstm_cell/Const_21rnn/basic_lstm_cell/BiasAdd_7*
	num_split*`
_output_shapesN
L:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0
a
rnn/basic_lstm_cell/Const_23Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 

rnn/basic_lstm_cell/Add_14Addrnn/basic_lstm_cell/split_7:2rnn/basic_lstm_cell/Const_23*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
w
rnn/basic_lstm_cell/Sigmoid_21Sigmoidrnn/basic_lstm_cell/Add_14*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_21Mulrnn/basic_lstm_cell/Add_13rnn/basic_lstm_cell/Sigmoid_21*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
x
rnn/basic_lstm_cell/Sigmoid_22Sigmoidrnn/basic_lstm_cell/split_7*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
t
rnn/basic_lstm_cell/Tanh_14Tanhrnn/basic_lstm_cell/split_7:1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

rnn/basic_lstm_cell/Mul_22Mulrnn/basic_lstm_cell/Sigmoid_22rnn/basic_lstm_cell/Tanh_14*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Add_15Addrnn/basic_lstm_cell/Mul_21rnn/basic_lstm_cell/Mul_22*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
q
rnn/basic_lstm_cell/Tanh_15Tanhrnn/basic_lstm_cell/Add_15*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
z
rnn/basic_lstm_cell/Sigmoid_23Sigmoidrnn/basic_lstm_cell/split_7:3*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

rnn/basic_lstm_cell/Mul_23Mulrnn/basic_lstm_cell/Tanh_15rnn/basic_lstm_cell/Sigmoid_23*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
d
random_normal/shapeConst*
_output_shapes
:*
valueB"      *
dtype0
W
random_normal/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Y
random_normal/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

"random_normal/RandomStandardNormalRandomStandardNormalrandom_normal/shape*
T0*
dtype0*
_output_shapes

:
{
random_normal/mulMul"random_normal/RandomStandardNormalrandom_normal/stddev*
T0*
_output_shapes

:
d
random_normalAddrandom_normal/mulrandom_normal/mean*
T0*
_output_shapes

:
X
Variable
VariableV2*
_output_shapes

:*
shape
:*
dtype0
x
Variable/AssignAssignVariablerandom_normal*
T0*
_class
loc:@Variable*
_output_shapes

:
i
Variable/readIdentityVariable*
T0*
_class
loc:@Variable*
_output_shapes

:
_
random_normal_1/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_1/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_1/stddevConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

$random_normal_1/RandomStandardNormalRandomStandardNormalrandom_normal_1/shape*
T0*
dtype0*
_output_shapes
:
}
random_normal_1/mulMul$random_normal_1/RandomStandardNormalrandom_normal_1/stddev*
T0*
_output_shapes
:
f
random_normal_1Addrandom_normal_1/mulrandom_normal_1/mean*
T0*
_output_shapes
:
R

Variable_1
VariableV2*
dtype0*
_output_shapes
:*
shape:
|
Variable_1/AssignAssign
Variable_1random_normal_1*
T0*
_class
loc:@Variable_1*
_output_shapes
:
k
Variable_1/readIdentity
Variable_1*
_class
loc:@Variable_1*
_output_shapes
:*
T0
m
MatMulMatMulrnn/basic_lstm_cell/Mul_23Variable/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
U
addAddMatMulVariable_1/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 

save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_96c46409ee724c96ab54b615b0c33007/part
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
Ç
save/SaveV2/tensor_namesConst"/device:CPU:0*l
valuecBaBVariableB
Variable_1Bglobal_stepBrnn/basic_lstm_cell/biasBrnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
|
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueBB B B B B *
dtype0*
_output_shapes
:
ŕ
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesVariable
Variable_1global_steprnn/basic_lstm_cell/biasrnn/basic_lstm_cell/kernel"/device:CPU:0*
dtypes	
2	
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
 
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
N*
_output_shapes
:*
T0
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
Ę
save/RestoreV2/tensor_namesConst"/device:CPU:0*l
valuecBaBVariableB
Variable_1Bglobal_stepBrnn/basic_lstm_cell/biasBrnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:

save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueBB B B B B *
dtype0*
_output_shapes
:
ł
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*(
_output_shapes
:::::*
dtypes	
2	
u
save/AssignAssignVariablesave/RestoreV2*
T0*
_class
loc:@Variable*
_output_shapes

:
y
save/Assign_1Assign
Variable_1save/RestoreV2:1*
_class
loc:@Variable_1*
_output_shapes
:*
T0
w
save/Assign_2Assignglobal_stepsave/RestoreV2:2*
T0	*
_class
loc:@global_step*
_output_shapes
: 

save/Assign_3Assignrnn/basic_lstm_cell/biassave/RestoreV2:3*
T0*+
_class!
loc:@rnn/basic_lstm_cell/bias*
_output_shapes
:

save/Assign_4Assignrnn/basic_lstm_cell/kernelsave/RestoreV2:4*
T0*-
_class#
!loc:@rnn/basic_lstm_cell/kernel*
_output_shapes

:
h
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4
-
save/restore_allNoOp^save/restore_shard
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 

save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_5850f545c87143baa1af67a494ae2540/part*
dtype0*
_output_shapes
: 
j
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
_output_shapes
: *
N
S
save_1/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
É
save_1/SaveV2/tensor_namesConst"/device:CPU:0*l
valuecBaBVariableB
Variable_1Bglobal_stepBrnn/basic_lstm_cell/biasBrnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:
~
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
valueBB B B B B *
dtype0
č
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesVariable
Variable_1global_steprnn/basic_lstm_cell/biasrnn/basic_lstm_cell/kernel"/device:CPU:0*
dtypes	
2	
¨
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
T0*)
_class
loc:@save_1/ShardedFilename*
_output_shapes
: 
Ś
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
_output_shapes
:*
T0*
N
{
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0

save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
Ě
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*l
valuecBaBVariableB
Variable_1Bglobal_stepBrnn/basic_lstm_cell/biasBrnn/basic_lstm_cell/kernel*
dtype0*
_output_shapes
:

!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueBB B B B B *
dtype0*
_output_shapes
:
ť
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*(
_output_shapes
:::::*
dtypes	
2	
y
save_1/AssignAssignVariablesave_1/RestoreV2*
_output_shapes

:*
T0*
_class
loc:@Variable
}
save_1/Assign_1Assign
Variable_1save_1/RestoreV2:1*
T0*
_class
loc:@Variable_1*
_output_shapes
:
{
save_1/Assign_2Assignglobal_stepsave_1/RestoreV2:2*
_class
loc:@global_step*
_output_shapes
: *
T0	

save_1/Assign_3Assignrnn/basic_lstm_cell/biassave_1/RestoreV2:3*
_output_shapes
:*
T0*+
_class!
loc:@rnn/basic_lstm_cell/bias
Ą
save_1/Assign_4Assignrnn/basic_lstm_cell/kernelsave_1/RestoreV2:4*
_output_shapes

:*
T0*-
_class#
!loc:@rnn/basic_lstm_cell/kernel
t
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"Ü
trainable_variablesÄÁ

rnn/basic_lstm_cell/kernel:0!rnn/basic_lstm_cell/kernel/Assign!rnn/basic_lstm_cell/kernel/read:027rnn/basic_lstm_cell/kernel/Initializer/random_uniform:08

rnn/basic_lstm_cell/bias:0rnn/basic_lstm_cell/bias/Assignrnn/basic_lstm_cell/bias/read:02,rnn/basic_lstm_cell/bias/Initializer/zeros:08
A

Variable:0Variable/AssignVariable/read:02random_normal:08
I
Variable_1:0Variable_1/AssignVariable_1/read:02random_normal_1:08"k
global_step\Z
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0"Ź
	variables
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0

rnn/basic_lstm_cell/kernel:0!rnn/basic_lstm_cell/kernel/Assign!rnn/basic_lstm_cell/kernel/read:027rnn/basic_lstm_cell/kernel/Initializer/random_uniform:08

rnn/basic_lstm_cell/bias:0rnn/basic_lstm_cell/bias/Assignrnn/basic_lstm_cell/bias/read:02,rnn/basic_lstm_cell/bias/Initializer/zeros:08
A

Variable:0Variable/AssignVariable/read:02random_normal:08
I
Variable_1:0Variable_1/AssignVariable_1/read:02random_normal_1:08" 
legacy_init_op


group_deps*
serving_defaultu
/
rawdata$
Placeholder:0˙˙˙˙˙˙˙˙˙&
output
add:0˙˙˙˙˙˙˙˙˙tensorflow/serving/predict*
	predictedu
/
rawdata$
Placeholder:0˙˙˙˙˙˙˙˙˙&
output
add:0˙˙˙˙˙˙˙˙˙tensorflow/serving/predict