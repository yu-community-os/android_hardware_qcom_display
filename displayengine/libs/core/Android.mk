LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE                  := libsde
LOCAL_MODULE_TAGS             := optional
LOCAL_C_INCLUDES              := hardware/qcom/display/$(QCOM_HARDWARE_VARIANT)/displayengine/include/ \
                                 $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_CFLAGS                  := -Wno-missing-field-initializers -Wno-unused-parameter \
                                 -Wconversion -Wall -Werror \
                                 -DLOG_TAG=\"SDE\"
LOCAL_SHARED_LIBRARIES        := libdl libsdeutils
ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
endif
LOCAL_SRC_FILES               := core_interface.cpp \
                                 core_impl.cpp \
                                 display_base.cpp \
                                 display_primary.cpp \
                                 display_hdmi.cpp \
                                 display_virtual.cpp \
                                 comp_manager.cpp \
                                 strategy_default.cpp \
                                 res_manager.cpp \
                                 res_config.cpp \
                                 offline_ctrl.cpp \
                                 hw_interface.cpp \
                                 hw_framebuffer.cpp \
                                 dump_impl.cpp \
                                 buffer_manager.cpp

include $(BUILD_SHARED_LIBRARY)
