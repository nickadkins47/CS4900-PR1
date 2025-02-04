
python = poetry run python
train = cd experiments && $(python) ppo_gridnet.py
eval = cd experiments && $(python) ppo_gridnet_eval.py
sota = gym-microrts-static-files/agent_sota.pt

train:
	$(train) --total-timesteps 100000000 --capture-video --seed 1

SOTA_vs_SOTA:
	$(eval) --agent-model-path $(sota) --agent2-model-path $(sota)

SOTA_vs_coacAI:
	$(eval)	--agent-model-path $(sota) --ai coacAI
