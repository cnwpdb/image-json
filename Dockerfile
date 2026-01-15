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

# 手动安装 LayerStyle (包含 PurgeVRAM V2)
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chflame163/ComfyUI_LayerStyle && \
    pip install -r ComfyUI_LayerStyle/requirements.txt

# 模型通过 Network Volume 挂载，不需要在这里下载
