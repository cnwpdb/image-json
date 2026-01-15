# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail was-ns@3.0.1 --mode remote
RUN comfy node install --exit-on-fail comfyui_tinyterranodes@2.0.10
RUN comfy node install --exit-on-fail comfyui-impact-pack@8.28.2
RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.5
RUN comfy node install --exit-on-fail ComfyUI_Comfyroll_CustomNodes
RUN comfy node install --exit-on-fail qweneditutils@2.0.7
RUN comfy node install --exit-on-fail seedvr2_videoupscaler@2.5.24
# Could not resolve unknown_registry node 'LayerUtility: PurgeVRAM V2' (no aux_id) - skipping

# download models into comfyui
# RUN # Could not find URL for consistence_edit_v2.safetensors (type: loras)
# RUN # Could not find URL for Qwen-Image-Edit-F2P.safetensors (type: loras)
# RUN # Could not find URL for ema_vae_fp16.safetensors (type: Unknown)
# RUN # Could not find URL for seedvr2_ema_3b_fp8_e4m3fn.safetensors (type: Unknown)
# RUN # Could not find URL for Qwen-Rapid-AIO-NSFW-v14.safetensors (type: checkpoints)
# RUN # Could not find URL for qwen-image_nsfw_adv_v1.0.safetensors (type: loras)

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
