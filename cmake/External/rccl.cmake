if (NOT __NCCL_INCLUDED)
  set(__NCCL_INCLUDED TRUE)

  if (USE_SYSTEM_NCCL)
    # NCCL_ROOT, NCCL_LIB_DIR, NCCL_INCLUDE_DIR will be accounted in the following line.
    find_package(RCCL REQUIRED)
    if (RCCL_FOUND)
      message (STATUS "RCCL Found!")
      add_library(__caffe2_nccl INTERFACE)
      target_link_libraries(__caffe2_nccl INTERFACE ${PYTORCH_RCCL_LIBRARIES})
      target_include_directories(__caffe2_nccl INTERFACE ${RCCL_INCLUDE_DIRS})
    else()
      message (STATUS "RCCL NOT Found!")
    endif()
  else()
    message (STATUS "USE_SYSTEM_NCCL needs to be set to 1 to use RCCL")
  endif()
endif()

