_chair = _this select 0;
_unit = _this select 1;

_anim = selectRandom ["HubSittingChairA_idle1","HubSittingChairA_idle2","HubSittingChairA_idle3","HubSittingChairA_move1","HubSittingChairB_idle1","HubSittingChairB_idle2","HubSittingChairB_idle3","HubSittingChairB_move1","HubSittingChairC_idle1","HubSittingChairC_idle2","HubSittingChairC_idle3","HubSittingChairC_move1","HubSittingChairUA_idle1","HubSittingChairUA_idle2","HubSittingChairUA_idle3","HubSittingChairUA_move1","HubSittingChairUB_idle1","HubSittingChairUB_idle2","HubSittingChairUB_idle3","HubSittingChairUB_move1","HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"];

[_unit,_anim] remoteExec ["switchMove",0];

_unit setPos [getPos _chair select 0,((getPos _chair select 1) + 0.15),getPos _chair select 2];
_unit setDir (getDir _chair)-180;

_unit setPos [getPos _unit select 0, getPos _unit select 1,((getPos _unit select 2) + 0.004)];

getup= _unit addAction ["<t color='#9988FF'>Stand Up</t>", {
//	detach player;
	_this select 1 removeAction getup; 
	//AidlPercMstpSlowWrflDnon_AI
	[_this select 1, "" ] remoteExec ["switchMove",0];
}];