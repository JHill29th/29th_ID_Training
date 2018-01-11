_props=[base,map,pallet];
_anchor=base;
_mainMonitor1=monitor2;
_mainMonitor2=monitor3;
_sideMonitor1=monitor1;
_sideMonitor2=monitor4;

_sideMonitorAngle=25;
_displayGridHeight=-0.2;
_forwardPositioning=0;

		{
	_x allowdamage false;
		}foreach _props;


_mainMonitor1 attachto [_anchor,[0,_forwardPositioning+1.2,_displayGridHeight]];
_mainMonitor2 attachto [_anchor,[0,_forwardPositioning+1.2,_displayGridHeight-1]];
	map attachto [_mainMonitor1,[-2,-0.25,-0.46]];
	map setdir -40;

	_sideMonitor1 attachto [_anchor,[1.56,_forwardPositioning+0.9,_displayGridHeight-0.22]];
	_sideMonitor1 setdir _sideMonitorAngle;

	_sideMonitor2 attachto [_anchor,[1.56,_forwardPositioning+0.9,_displayGridHeight-0.9]];
	_sideMonitor2 setdir _sideMonitorAngle;
	pallet attachto [_sideMonitor2,[0,0,0+0.2]];
	pallet setdir -40;
	



