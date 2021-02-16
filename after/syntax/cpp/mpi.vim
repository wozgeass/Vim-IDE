" Vim syntax file
" Language:  C++ MPI	
" Maintainer:  JiangXin <jiangxinnju@163.com>	
" Last Change:	25/04/2015

syntax keyword MPInamespace MPI
syntax keyword MPInamespace PMPI

syntax keyword MPIconst *_NULL
syntax keyword MPIconst _LONG_LONG
syntax keyword MPIconst ANY_SOURCE
syntax keyword MPIconst ANY_TAG
syntax keyword MPIconst APPNUM
syntax keyword MPIconst ARGV_NULL
syntax keyword MPIconst ARGVS_NULL
syntax keyword MPIconst BAND
syntax keyword MPIconst BOR
syntax keyword MPIconst BOTTOM
syntax keyword MPIconst BSEND_OVERHEAD
syntax keyword MPIconst BXOR
syntax keyword MPIconst BYTE
syntax keyword MPIconst CHAR
syntax keyword MPIconst CHARACTER
syntax keyword MPIconst COMBINER_CONTIGUOUS
syntax keyword MPIconst COMBINER_DARRAY
syntax keyword MPIconst COMBINER_DUP
syntax keyword MPIconst COMBINER_F90_COMPLEX
syntax keyword MPIconst COMBINER_F90_INTEGER
syntax keyword MPIconst COMBINER_F90_REAL
syntax keyword MPIconst COMBINER_HINDEXED
syntax keyword MPIconst COMBINER_HINDEXED_INTEGER
syntax keyword MPIconst COMBINER_HVECTOR
syntax keyword MPIconst COMBINER_HVECTOR_INTEGER
syntax keyword MPIconst COMBINER_INDEXED
syntax keyword MPIconst COMBINER_INDEXED_BLOCK
syntax keyword MPIconst COMBINER_NAMED
syntax keyword MPIconst COMBINER_STRUCT
syntax keyword MPIconst COMBINER_STRUCT_INTEGER
syntax keyword MPIconst COMBINER_SUBARRAY
syntax keyword MPIconst COMBINER_VECTOR
syntax keyword MPIconst COMM_NULL
syntax keyword MPIconst COMM_PARENT
syntax keyword MPIconst COMM_SELF
syntax keyword MPIconst COMM_WORLD
syntax keyword MPIconst COMPLEX
syntax keyword MPIconst CONGRUENT
syntax keyword MPIconst DATATYPE_NULL
syntax keyword MPIconst DSIPLACEMENT_CURRENT
syntax keyword MPIconst DIST_GRAPH
syntax keyword MPIconst DISTRIBUTE_BLOCK
syntax keyword MPIconst DISTRIBUTE_CYCLIC
syntax keyword MPIconst DISTRIBUTE_DFLT_DARG
syntax keyword MPIconst DISTRIBUTE_NONE
syntax keyword MPIconst DOUBLE
syntax keyword MPIconst DOUBLE_COMPLEX
syntax keyword MPIconst DOUBLE_INT
syntax keyword MPIconst DOUBLE_PRECISION
syntax keyword MPIconst DUP_FN
syntax keyword MPIconst ERR_ACCESS
syntax keyword MPIconst ERR_AMODE
syntax keyword MPIconst ERR_ARG
syntax keyword MPIconst ERR_ASSERT
syntax keyword MPIconst ERR_BAD_FILE
syntax keyword MPIconst ERR_BAD_BASE
syntax keyword MPIconst ERR_BIFFER
syntax keyword MPIconst ERR_COMM
syntax keyword MPIconst ERR_CONVERSION
syntax keyword MPIconst ERR_COUNT
syntax keyword MPIconst ERR_DIMS
syntax keyword MPIconst ERR_DISP
syntax keyword MPIconst ERR_DUP_DATAREP
syntax keyword MPIconst ERR_FILE
syntax keyword MPIconst ERR_FILE_EXISTS
syntax keyword MPIconst ERR_IN_USE
syntax keyword MPIconst ERR_GROUP
syntax keyword MPIconst ERR_IN_STATUS
syntax keyword MPIconst ERR_INFO
syntax keyword MPIconst ERR_INFO_KEY
syntax keyword MPIconst ERR_INFO_NOKEY
syntax keyword MPIconst ERR__INFO_VALUE
syntax keyword MPIconst ERR_INTERN
syntax keyword MPIconst ERR_IO
syntax keyword MPIconst ERR_KEYVAL
syntax keyword MPIconst ERR_LASTCODE
syntax keyword MPIconst ERR_LOCKTYPE
syntax keyword MPIconst ERR_NAME
syntax keyword MPIconst ERR_NO_MEM
syntax keyword MPIconst ERR_NO_SPACE
syntax keyword MPIconst ERR_NO_SUCH_FILE
syntax keyword MPIconst ERR_NOT_SAME
syntax keyword MPIconst ERR_OP
syntax keyword MPIconst ERR_OTHER
syntax keyword MPIconst ERR_PENDING
syntax keyword MPIconst ERR_PORT
syntax keyword MPIconst ERR_QUOTA
syntax keyword MPIconst ERR_RANK
syntax keyword MPIconst ERR_READ_ONLY
syntax keyword MPIconst ERR_REQUEST
syntax keyword MPIconst ERR_RMA_CONFLICT
syntax keyword MPIconst ERR_RMA_SYNC
syntax keyword MPIconst ERR_ROOT
syntax keyword MPIconst ERR_SERVICE
syntax keyword MPIconst ERR_SIZE
syntax keyword MPIconst ERR_SPAWN
syntax keyword MPIconst ERR_TAG
syntax keyword MPIconst ERR_TOPOLOGY
syntax keyword MPIconst ERR_TRUNCATE
syntax keyword MPIconst ERR_TYPE
syntax keyword MPIconst ERR_UNKNOWN
syntax keyword MPIconst ERR_UNSUPPORTED_DATAREP
syntax keyword MPIconst ERR_UNSUPPORTED_OPERATION
syntax keyword MPIconst ERR_WIN
syntax keyword MPIconst ERRHANDLER_NULL
syntax keyword MPIconst ERRORS_ARE_FATAL
syntax keyword MPIconst ERRORS_RETURN
syntax keyword MPIconst ERRORS_THROW_EXCEPTIONS
syntax keyword MPIconst F_COMPLEX
syntax keyword MPIconst F_COMPLEX16
syntax keyword MPIconst F_COMPLEX32
syntax keyword MPIconst F_COMPLEX4
syntax keyword MPIconst F_COMPLEX8
syntax keyword MPIconst F_DOUBLE_COMPLEX
syntax keyword MPIconst FILE_NULL
syntax keyword MPIconst FLOAT
syntax keyword MPIconst FLOAT_INT
syntax keyword MPIconst GRAPH
syntax keyword MPIconst GROUP_EMPTY
syntax keyword MPIconst GROUP_NULL
syntax keyword MPIconst HOST
syntax keyword MPIconst IDENT
syntax keyword MPIconst IN_PLACE
syntax keyword MPIconst INFO_NULL
syntax keyword MPIconst INT
syntax keyword MPIconst INTEGER
syntax keyword MPIconst INTEGER1
syntax keyword MPIconst INTEGER16
syntax keyword MPIconst INTEGER2
syntax keyword MPIconst INTEGER4
syntax keyword MPIconst INTEGER8
syntax keyword MPIconst IO
syntax keyword MPIconst KEYVAL_INVALID
syntax keyword MPIconst LAND
syntax keyword MPIconst LASTUSEDCODE
syntax keyword MPIconst LB
syntax keyword MPIconst LOCK_EXCLUSIVE
syntax keyword MPIconst LOCK_SHARED
syntax keyword MPIconst LOGICAL
syntax keyword MPIconst LONG
syntax keyword MPIconst LONG_DOUBLE
syntax keyword MPIconst LONG_DOUBLE_COMPLEX
syntax keyword MPIconst LONG_DOUBLE_INT
syntax keyword MPIconst LONG_INT
syntax keyword MPIconst LONG_LONG
syntax keyword MPIconst LONG_LONG_INT
syntax keyword MPIconst LOR
syntax keyword MPIconst LXOR
syntax keyword MPIconst MAX
syntax keyword MPIconst MAX_DATAREP_STRING
syntax keyword MPIconst MAX_ERROR_STRING
syntax keyword MPIconst MAX_INFO_KEY
syntax keyword MPIconst MAX_INFO_VAL
syntax keyword MPIconst MAX_OBJECT_NAME
syntax keyword MPIconst _MAX_PORT_NAME
syntax keyword MPIconst MAX_PROCESSOR_NAME
syntax keyword MPIconst MAXLOC
syntax keyword MPIconst MIN
syntax keyword MPIconst MINLOC
syntax keyword MPIconst MODE_APPEND
syntax keyword MPIconst MODE_CREATE
syntax keyword MPIconst MODE_DELETE_ON_CLOSE
syntax keyword MPIconst MODE_EXCL
syntax keyword MPIconst MODE_NOCHECK
syntax keyword MPIconst MODE_NOPRECEDE
syntax keyword MPIconst MODE_NOPUT
syntax keyword MPIconst MODE_NOSTORE
syntax keyword MPIconst MODE_NOSUCCEED
syntax keyword MPIconst MODE_RDONLY
syntax keyword MPIconst MODE_RDWR
syntax keyword MPIconst MODE_SEQUENTIAL
syntax keyword MPIconst MODE_UNIQUE_OPEN
syntax keyword MPIconst MODE_WRONLY
syntax keyword MPIconst NULL_COPY_FN
syntax keyword MPIconst NULL_DELETE_FN
syntax keyword MPIconst OP_NULL
syntax keyword MPIconst ORDER_C
syntax keyword MPIconst ORDER_FORTRAN
syntax keyword MPIconst PACKED
syntax keyword MPIconst PROC_NULL
syntax keyword MPIconst PROD
syntax keyword MPIconst REAL
syntax keyword MPIconst REAL16
syntax keyword MPIconst REAL2
syntax keyword MPIconst REAL4
syntax keyword MPIconst REAL8
syntax keyword MPIconst REPLACE
syntax keyword MPIconst REQUEST_NULL
syntax keyword MPIconst ROOT
syntax keyword MPIconst SEEK_CUR
syntax keyword MPIconst SEEK_END
syntax keyword MPIconst SEEK_SET
syntax keyword MPIconst SHORT
syntax keyword MPIconst SHORT_INT
syntax keyword MPIconst SIGNED_CHAR
syntax keyword MPIconst SIMILAR
syntax keyword MPIconst SUCCESS
syntax keyword MPIconst SUM
syntax keyword MPIconst TAG_UB
syntax keyword MPIconst THREAD_FUNNELED
syntax keyword MPIconst THREAD_MULTIPLE
syntax keyword MPIconst THREAD_SERIALIZED
syntax keyword MPIconst THREAD_SINGLE
syntax keyword MPIconst TWODOUBLE_PRECISION
syntax keyword MPIconst TWOINT
syntax keyword MPIconst TWOINTEGER
syntax keyword MPIconst TWOREAL
syntax keyword MPIconst TYPECLASS_COMPLEX
syntax keyword MPIconst TYPECLASS_INTEGER
syntax keyword MPIconst TYPECLASS_REAL
syntax keyword MPIconst UB
syntax keyword MPIconst UNDEFINED
syntax keyword MPIconst UNEQUAL
syntax keyword MPIconst UNIVERSE_SIZE
syntax keyword MPIconst UNSIGNED
syntax keyword MPIconst UNSIGNED_CHAR
syntax keyword MPIconst UNSIGNED_LONG
syntax keyword MPIconst UNSIGNED_LONG_LONG
syntax keyword MPIconst UNSIGNED_SHORT
syntax keyword MPIconst WCHAR
syntax keyword MPIconst WIN_BASE
syntax keyword MPIconst WIN_DISP_UNIT
syntax keyword MPIconst WIN_NULL
syntax keyword MPIconst WIN_SIZE
syntax keyword MPIconst WTIME_IS_GLOBAL


syntax keyword MPItype Aint
syntax keyword MPItype Cartcomm
syntax keyword MPItype Comm
syntax keyword MPItype Datatype
syntax keyword MPItype Distgraphcomm
syntax keyword MPItype Errhandler
syntax keyword MPItype Exception
syntax keyword MPItype File
syntax keyword MPItype Graphcomm
syntax keyword MPItype Grequest
syntax keyword MPItype Group
syntax keyword MPItype Info
syntax keyword MPItype Intercomm
syntax keyword MPItype Inrarcomm
syntax keyword MPItype Offset
syntax keyword MPItype Op
syntax keyword MPItype Prequest
syntax keyword MPItype Request
syntax keyword MPItype Status
syntax keyword MPItype Win


syntax keyword MPIcallbackfunction Copy_attr_function
syntax keyword MPIcallbackfunction Delete_attr_function
syntax keyword MPIcallbackfunction Errhandler_fn
syntax keyword MPIcallbackfunction Errhandler_function
syntax keyword MPIcallbackfunction Copy_function
syntax keyword MPIcallbackfunction Conversion_function
syntax keyword MPIcallbackfunction Extent_function
syntax keyword MPIcallbackfunction Delete_function
syntax keyword MPIcallbackfunction Errhandler_fn
syntax keyword MPIcallbackfunction Errhandler_function
syntax keyword MPIcallbackfunction Cancel_function
syntax keyword MPIcallbackfunction Free_function
syntax keyword MPIcallbackfunction Query_function
syntax keyword MPIcallbackfunction Handler_function
syntax keyword MPIcallbackfunction Type_copy_attr_function
syntax keyword MPIcallbackfunction Type_delete_attr_function
syntax keyword MPIcallbackfunction User_function
syntax keyword MPIcallbackfunction Copy_attr_function
syntax keyword MPIcallbackfunction Delete_attr_function
syntax keyword MPIcallbackfunction Errhandler_fn
syntax keyword MPIcallbackfunction Errhandler_function



syntax keyword MPIfunction Abort
syntax keyword MPIfunction Accept
syntax keyword MPIfunction Accumulate
syntax keyword MPIfunction Add_error_class
syntax keyword MPIfunction Add_error_code
syntax keyword MPIfunction Add_error_string
syntax keyword MPIfunction Address
syntax keyword MPIfunction Allgather
syntax keyword MPIfunction Allgatherv
syntax keyword MPIfunction Alloc_mem
syntax keyword MPIfunction Allreduce
syntax keyword MPIfunction Alltoall
syntax keyword MPIfunction Alltoallv
syntax keyword MPIfunction Attr_delete
syntax keyword MPIfunction Attr_get
syntax keyword MPIfunction Attr_put
syntax keyword MPIfunction Barrier
syntax keyword MPIfunction Bcast
syntax keyword MPIfunction Bsend
syntax keyword MPIfunction Bsend_init
syntax keyword MPIfunction Buffer_attach
syntax keyword MPIfunction Buffer_detach
syntax keyword MPIfunction C2f
syntax keyword MPIfunction Call_errhandler
syntax keyword MPIfunction Cancel
syntax keyword MPIfunction Cart_coords
syntax keyword MPIfunction Cart_create
syntax keyword MPIfunction Cartdim_get
syntax keyword MPIfunction Cart_get
syntax keyword MPIfunction Cart_map
syntax keyword MPIfunction Cart_rank
syntax keyword MPIfunction Cart_shift
syntax keyword MPIfunction Cart_sub
syntax keyword MPIfunction Clone
syntax keyword MPIfunction Close
syntax keyword MPIfunction Close_port
syntax keyword MPIfunction Commutative
syntax keyword MPIfunction Compare
syntax keyword MPIfunction Complete
syntax keyword MPIfunction Connect
syntax keyword MPIfunction Create
syntax keyword MPIfunction Create_errhandler
syntax keyword MPIfunction Create_keyval
syntax keyword MPIfunction Delete
syntax keyword MPIfunction Delete_attr
syntax keyword MPIfunction Difference
syntax keyword MPIfunction Dims_create
syntax keyword MPIfunction Disconnect
syntax keyword MPIfunction Dist_graph_create
syntax keyword MPIfunction Dist_graph_create_adjacent
syntax keyword MPIfunction Dist_graph_neighbor_count
syntax keyword MPIfunction Dist_graph_neighbors
syntax keyword MPIfunction Dist_graph_neighbors_count
syntax keyword MPIfunction Dist_neighbors
syntax keyword MPIfunction Dist_neighbors_count
syntax keyword MPIfunction Dup
syntax keyword MPIfunction Dup_fn
syntax keyword MPIfunction Errhandler_c2f
syntax keyword MPIfunction Errhandler_create
syntax keyword MPIfunction Errhandler_f2c
syntax keyword MPIfunction Errhandler_free
syntax keyword MPIfunction Errhandler_get
syntax keyword MPIfunction Errhandler_set
syntax keyword MPIfunction Error_class
syntax keyword MPIfunction Error_string
syntax keyword MPIfunction Excl
syntax keyword MPIfunction Exscan
syntax keyword MPIfunction F2c
syntax keyword MPIfunction Fence
syntax keyword MPIfunction Finalize
syntax keyword MPIfunction Finalized
syntax keyword MPIfunction Free
syntax keyword MPIfunction Free_keyval
syntax keyword MPIfunction Free_mem
syntax keyword MPIfunction Gather
syntax keyword MPIfunction Gatherv
syntax keyword MPIfunction Get
syntax keyword MPIfunction Get_address
syntax keyword MPIfunction Get_amode
syntax keyword MPIfunction Get_atomicity
syntax keyword MPIfunction Get_attr
syntax keyword MPIfunction Get_attr
syntax keyword MPIfunction Get_byte_offset
syntax keyword MPIfunction Get_count
syntax keyword MPIfunction Get_elements
syntax keyword MPIfunction Get_errhandler
syntax keyword MPIfunction Get_group
syntax keyword MPIfunction Get_info
syntax keyword MPIfunction Get_name
syntax keyword MPIfunction Get_nkeys
syntax keyword MPIfunction Get_nthkey
syntax keyword MPIfunction Get_parent
syntax keyword MPIfunction Get_position
syntax keyword MPIfunction Get_position_shared
syntax keyword MPIfunction Get_processor_name
syntax keyword MPIfunction Get_rank
syntax keyword MPIfunction Get_size
syntax keyword MPIfunction Get_status
syntax keyword MPIfunction Get_type_extent
syntax keyword MPIfunction Get_valuelen
syntax keyword MPIfunction Get_version
syntax keyword MPIfunction Get_view
syntax keyword MPIfunction Graph_create
syntax keyword MPIfunction Graphdims_get
syntax keyword MPIfunction Graph_get
syntax keyword MPIfunction Graph_map
syntax keyword MPIfunction Graph_neighbors
syntax keyword MPIfunction Graph_neighbors_count
syntax keyword MPIfunction Group
syntax keyword MPIfunction Ibsend
syntax keyword MPIfunction Incl
syntax keyword MPIfunction Init
syntax keyword MPIfunction Initialized
syntax keyword MPIfunction Init_thread
syntax keyword MPIfunction Intercomm_create
syntax keyword MPIfunction Intercomm_merge
syntax keyword MPIfunction Intersection
syntax keyword MPIfunction Iprobe
syntax keyword MPIfunction Iread
syntax keyword MPIfunction Iread_at
syntax keyword MPIfunction Iread_shared
syntax keyword MPIfunction Irecv
syntax keyword MPIfunction Irsend
syntax keyword MPIfunction Isend
syntax keyword MPIfunction Issend
syntax keyword MPIfunction Is_thread_main
syntax keyword MPIfunction Iwrite
syntax keyword MPIfunction Iwrite_at
syntax keyword MPIfunction Iwrite_shared
syntax keyword MPIfunction Join
syntax keyword MPIfunction Keyval_create
syntax keyword MPIfunction Keyval_free
syntax keyword MPIfunction Lock
syntax keyword MPIfunction Lookup_name
syntax keyword MPIfunction N_port
syntax keyword MPIfunction Null_copy_fn
syntax keyword MPIfunction Null_delete_fn
syntax keyword MPIfunction Open
syntax keyword MPIfunction Pack
syntax keyword MPIfunction Pack_external
syntax keyword MPIfunction Pack_external_size
syntax keyword MPIfunction Pack_size
syntax keyword MPIfunction Pcontrol
syntax keyword MPIfunction Post
syntax keyword MPIfunction Preallocate
syntax keyword MPIfunction Probe
syntax keyword MPIfunction Publish_name
syntax keyword MPIfunction Put
syntax keyword MPIfunction Query_thread
syntax keyword MPIfunction Range_excl
syntax keyword MPIfunction Range_incl
syntax keyword MPIfunction Rank
syntax keyword MPIfunction Rank
syntax keyword MPIfunction Read
syntax keyword MPIfunction Read_all
syntax keyword MPIfunction Read_all_begin
syntax keyword MPIfunction Read_all_end
syntax keyword MPIfunction Read_at
syntax keyword MPIfunction Read_at_all
syntax keyword MPIfunction Read_at_all_begin
syntax keyword MPIfunction Read_at_all_end
syntax keyword MPIfunction Read_ordered
syntax keyword MPIfunction Read_ordered_begin
syntax keyword MPIfunction Read_ordered_end
syntax keyword MPIfunction Read_shared
syntax keyword MPIfunction Recv
syntax keyword MPIfunction Recv_init
syntax keyword MPIfunction Reduce
syntax keyword MPIfunction Reduce_local
syntax keyword MPIfunction Reduce_scatter
syntax keyword MPIfunction Reduce_scatter_block
syntax keyword MPIfunction Register_datarep
syntax keyword MPIfunction Remote_group
syntax keyword MPIfunction Remote_size
syntax keyword MPIfunction Rsend
syntax keyword MPIfunction Rsend_init
syntax keyword MPIfunction Scan
syntax keyword MPIfunction Scatter
syntax keyword MPIfunction Scatterv
syntax keyword MPIfunction Seek
syntax keyword MPIfunction Seek_shared
syntax keyword MPIfunction Send
syntax keyword MPIfunction Send_init
syntax keyword MPIfunction Sendrecv
syntax keyword MPIfunction Sendrecv_replace
syntax keyword MPIfunction Set
syntax keyword MPIfunction Set_atomicity
syntax keyword MPIfunction Set_attr
syntax keyword MPIfunction Set_attr
syntax keyword MPIfunction Set_cancelled
syntax keyword MPIfunction Set_elements
syntax keyword MPIfunction Set_errhandler
syntax keyword MPIfunction Set_info
syntax keyword MPIfunction Set_name
syntax keyword MPIfunction Set_size
syntax keyword MPIfunction Set_view
syntax keyword MPIfunction Size
syntax keyword MPIfunction Sizeof
syntax keyword MPIfunction Spawn
syntax keyword MPIfunction Spawn_multiple
syntax keyword MPIfunction Split
syntax keyword MPIfunction Ssend
syntax keyword MPIfunction Ssend_init
syntax keyword MPIfunction Start
syntax keyword MPIfunction Startall
syntax keyword MPIfunction Sync
syntax keyword MPIfunction Test
syntax keyword MPIfunction Testall
syntax keyword MPIfunction Testany
syntax keyword MPIfunction Test_cancelled
syntax keyword MPIfunction Test_inter
syntax keyword MPIfunction Testsome
syntax keyword MPIfunction Topo_test
syntax keyword MPIfunction Translate_ranks
syntax keyword MPIfunction Type_c2f
syntax keyword MPIfunction Type_commit
syntax keyword MPIfunction Type_contiguous
syntax keyword MPIfunction Type_create_darray
syntax keyword MPIfunction Type_create_f90_complex
syntax keyword MPIfunction Type_create_f90_integer
syntax keyword MPIfunction Type_create_f90_real
syntax keyword MPIfunction Type_create_hindexed
syntax keyword MPIfunction Type_create_hvector
syntax keyword MPIfunction Type_create_indexed_block
syntax keyword MPIfunction Type_create_keyval
syntax keyword MPIfunction Type_create_resized
syntax keyword MPIfunction Type_create_struct
syntax keyword MPIfunction Type_create_subarray
syntax keyword MPIfunction Type_delete_attr
syntax keyword MPIfunction Type_dup
syntax keyword MPIfunction Type_dup_fn
syntax keyword MPIfunction Type_extent
syntax keyword MPIfunction Type_f2c
syntax keyword MPIfunction Type_free
syntax keyword MPIfunction Type_free_keyval
syntax keyword MPIfunction Type_get_attr
syntax keyword MPIfunction Type_get_contents
syntax keyword MPIfunction Type_get_envelope
syntax keyword MPIfunction Type_get_extent
syntax keyword MPIfunction Type_get_name
syntax keyword MPIfunction Type_get_true_extent
syntax keyword MPIfunction Type_hindexed
syntax keyword MPIfunction Type_hvector
syntax keyword MPIfunction Type_indexed
syntax keyword MPIfunction Type_lb
syntax keyword MPIfunction Type_match_size
syntax keyword MPIfunction Type_null_copy_fn
syntax keyword MPIfunction Type_null_delete_fn
syntax keyword MPIfunction Type_set_attr
syntax keyword MPIfunction Type_set_name
syntax keyword MPIfunction Type_size
syntax keyword MPIfunction Type_struct
syntax keyword MPIfunction Type_ub
syntax keyword MPIfunction Type_vector
syntax keyword MPIfunction Union
syntax keyword MPIfunction Unlock
syntax keyword MPIfunction Unpack
syntax keyword MPIfunction Unpack_external
syntax keyword MPIfunction Unpublish_name
syntax keyword MPIfunction Wait
syntax keyword MPIfunction Wait
syntax keyword MPIfunction Waitall
syntax keyword MPIfunction Waitany
syntax keyword MPIfunction Waitsome
syntax keyword MPIfunction Write
syntax keyword MPIfunction Write_all
syntax keyword MPIfunction Write_all_begin
syntax keyword MPIfunction Write_all_end
syntax keyword MPIfunction Write_at
syntax keyword MPIfunction Write_at_all
syntax keyword MPIfunction Write_at_all_begin
syntax keyword MPIfunction Write_at_all_end
syntax keyword MPIfunction Write_ordered
syntax keyword MPIfunction Write_ordered_begin
syntax keyword MPIfunction Write_ordered_end
syntax keyword MPIfunction Write_shared
syntax keyword MPIfunction Wtick
syntax keyword MPIfunction Wtime

" Default highlighting
if version >= 508 || !exists("did_mpi_syntax_inits")
  if version < 508
    let did_mpi_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink MPInamespace Constant
  HiLink MPIconst Constant
  HiLink MPItype Typedef
  HiLink MPIcallbackfunction Function
  HiLink MPIfunction Function
  delcommand HiLink
endif

