from agency_swarm import Agent, ModelSettings
from openai.types.shared import Reasoning


tipmaster_ai = Agent(
    name="TIPMASTER AI",
    description="A helpful and knowledgeable assistant that provides comprehensive support and guidance across various domains.",
    instructions="./instructions.md",
    tools_folder="./tools",
    files_folder="./files",
    model="gpt-5",
    model_settings=ModelSettings(
        max_tokens=25000,
        reasoning=Reasoning(
            effort="high",
            summary="auto",
        ),
    ),
)
