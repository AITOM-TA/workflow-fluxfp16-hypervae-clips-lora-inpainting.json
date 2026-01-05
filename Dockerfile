# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (no registry-verified nodes found)
# The workflow lists many custom nodes under unknown_registry but none include an aux_id (GitHub repo) so they cannot be resolved automatically.
# Could not resolve unknown_registry node: DetailerForEach (no aux_id)
# Could not resolve unknown_registry node: CLIPTextEncode (no aux_id)
# Could not resolve unknown_registry node: PreviewImage (no aux_id)
# Could not resolve unknown_registry node: DownloadAndLoadSAM2Model (no aux_id)
# Could not resolve unknown_registry node: Sam2Segmentation (no aux_id)
# Could not resolve unknown_registry node: Florence2toCoordinates (no aux_id)
# Could not resolve unknown_registry node: ImageAndMaskPreview (no aux_id)
# Could not resolve unknown_registry node: ImpactGaussianBlurMask (no aux_id)
# Could not resolve unknown_registry node: UNETLoader (no aux_id)
# Could not resolve unknown_registry node: DualCLIPLoader (no aux_id)
# Could not resolve unknown_registry node: VAELoader (no aux_id)
# Could not resolve unknown_registry node: Note (no aux_id)
# Could not resolve unknown_registry node: ImpactControlBridge (no aux_id)
# Could not resolve unknown_registry node: Note (no aux_id)
# Could not resolve unknown_registry node: Note (no aux_id)
# Could not resolve unknown_registry node: Note (no aux_id)
# Could not resolve unknown_registry node: Switch mask [Crystools] (no aux_id)
# Could not resolve unknown_registry node: Note (no aux_id)
# Could not resolve unknown_registry node: ModelSamplingFlux (no aux_id)
# Could not resolve unknown_registry node: FluxGuidance (no aux_id)
# Could not resolve unknown_registry node: CLIPAttentionMultiply (no aux_id)
# Could not resolve unknown_registry node: PreviewImage (no aux_id)
# Could not resolve unknown_registry node: MaskToImage (no aux_id)
# Could not resolve unknown_registry node: MaskToSEGS (no aux_id)
# Could not resolve unknown_registry node: GrowMask (no aux_id)
# Could not resolve unknown_registry node: InvertMask (no aux_id)
# Could not resolve unknown_registry node: easy imageSwitch (no aux_id)
# Could not resolve unknown_registry node: LoadImage (no aux_id)
# Could not resolve unknown_registry node: LoraLoaderModelOnly (no aux_id)
# Could not resolve unknown_registry node: SaveImage (no aux_id)
# Could not resolve unknown_registry node: LoraLoaderModelOnly (no aux_id)
# Could not resolve unknown_registry node: CLIPTextEncode (no aux_id)
# Could not resolve unknown_registry node: ImageResizeKJv2 (no aux_id)
# Could not resolve unknown_registry node: LoadImage (no aux_id)
# Could not resolve unknown_registry node: DownloadAndLoadFlorence2Model (no aux_id)
# Could not resolve unknown_registry node: PreviewImage (no aux_id)
# Could not resolve unknown_registry node: Florence2Run (no aux_id)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Kijai/sam2-safetensors/blob/main/sam2_hiera_base_plus.safetensors --relative-path models/sams --filename sam2_hiera_base_plus.safetensors
RUN comfy model download --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors --relative-path models/text_encoders --filename t5xxl_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/stable-diffusion-3.5-fp8/resolve/main/text_encoders/clip_l.safetensors --relative-path models/text_encoders --filename clip_l.safetensors
RUN comfy model download --url https://huggingface.co/diffusers/stable-diffusion-xl-1.0-inpainting-0.1/resolve/main/unet/diffusion_pytorch_model.safetensors --relative-path models/diffusion_models --filename diffusion_pytorch_model.safetensors
# RUN # Could not find URL for flux1-dev.safetensors (no exact match found during search)
# RUN # Could not find URL for benlora3.safetensors (no exact match found during search)

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
