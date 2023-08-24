Param (
    [string]$ENV_TYPE = "dev",
    [int]$PORT = 8501
)

# Set environment variable
$env:ENV_TYPE = $ENV_TYPE

# Set the current directory as ROOT_PATH environment variable
$env:ROOT_PATH = (Get-Location).Path

# Launch the Streamlit app
streamlit run app.py --server.port $PORT

# command to launch app in powershell
# .\launch_app.ps1 -ENV_TYPE dev -PORT 8501
# .\launch_app.ps1 -ENV_TYPE stage -PORT 8501
# .\launch_app.ps1 -ENV_TYPE prod -PORT 8501

