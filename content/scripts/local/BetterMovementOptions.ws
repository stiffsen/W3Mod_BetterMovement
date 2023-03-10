// class which handles the reading of all the in-game options
class BetterMovementOptions
{	


	var turnAdjustTimer : float;
	var runInCombat : bool;
	var speedMultiplier : float;
	var maxTurnAngle: float;
	
	var quickTurnWalk: bool;
	var quickTurnWalkThreshold: float;
	var quickTurnWalkSpeedReduction: float;
	
	var sharpTurnDetection : bool;
	var sharpTurnDetectionThreshold : float;
	var sharpTurnDetectionTimer : float;
	
	var directionSwitchTimeDelta : float;
	var directionSwitchEndLeniency: float;
	
	var directionSwitchForceWalk : bool;
	var directionSwitchSpeedMultiplier : float;
	
	var sprintSpeedMultiplier : float;
	var swimSpeedMultiplier : float;
	var walkSpeedMultiplier : float;
	
	var realTime : bool;

	public function readValues()
	{
		var wrapper : CInGameConfigWrapper;
		
		wrapper = theGame.GetInGameConfigWrapper();
		
		realTime = wrapper.GetVarValue('BetterMovementMisc', 'RealTime');
		
		turnAdjustTimer = StringToFloat(wrapper.GetVarValue('BetterMovementStraight', 'TurnAdjustTimer'));
		speedMultiplier = StringToFloat(wrapper.GetVarValue('BetterMovementStraight', 'SpeedMultiplier'));
		maxTurnAngle = StringToFloat(wrapper.GetVarValue('BetterMovementStraight', 'MaxTurnAngle'));
		
		
		quickTurnWalk = wrapper.GetVarValue('BetterMovementQuick', 'QuickTurnWalkEnabled');
		quickTurnWalkThreshold = StringToFloat(wrapper.GetVarValue('BetterMovementQuick', 'QuickTurnWalkThreshold'));
		quickTurnWalkSpeedReduction = StringToFloat(wrapper.GetVarValue('BetterMovementQuick', 'QuickTurnWalkSpeedReduction'));
		
		sharpTurnDetection = wrapper.GetVarValue('BetterMovementSharp', 'SharpTurnDetection');
		sharpTurnDetectionThreshold = StringToFloat(wrapper.GetVarValue('BetterMovementSharp', 'SharpTurnDetectionThreshold'));
		sharpTurnDetectionTimer = StringToFloat(wrapper.GetVarValue('BetterMovementSharp', 'SharpTurnDetectionTimer'));
		
		directionSwitchTimeDelta = StringToFloat(wrapper.GetVarValue('BetterMovementSharp', 'DirectionSwitchTimeDelta'));
		directionSwitchEndLeniency = StringToFloat(wrapper.GetVarValue('BetterMovementSharp', 'DirectionSwitchEndLeniency'));
		
		sharpTurnDetection = wrapper.GetVarValue('BetterMovementSharp', 'DirectionSwitchForceWalk');
		directionSwitchSpeedMultiplier = StringToFloat(wrapper.GetVarValue('BetterMovementSharp', 'DirectionSwitchSpeedMultiplier'));
		
		runInCombat = wrapper.GetVarValue('BetterMovementMisc', 'RunInCombatToggle');
		
		sprintSpeedMultiplier = StringToFloat(wrapper.GetVarValue('BetterMovementSpeed', 'SprintSpeedMultiplier'));
		swimSpeedMultiplier = StringToFloat(wrapper.GetVarValue('BetterMovementSpeed', 'SwimSpeedMultiplier'));
		walkSpeedMultiplier = StringToFloat(wrapper.GetVarValue('BetterMovementSpeed', 'WalkSpeedMultiplier'));
		
		if (realTime) {
		
			turnAdjustTimer = 0.001f;
			speedMultiplier = 13.0f;
			maxTurnAngle = 180.0f;
			quickTurnWalk = false;
			sharpTurnDetection = false;
		}
		
	}
	
	/////Straight
	public function getTurnAdjustTimer() : float
	{
		return turnAdjustTimer;
	}
	
	public function getSpeedMultiplier() : float
	{
		return speedMultiplier;
	}
	
	
	public function canRunInCombat() : bool
	{
		return runInCombat;
	}
	
	
	/////Quick Turn
	
	public function quickTurnWalkEnabled() : bool {
		return quickTurnWalk;
	}
	
	public function getQuickTurnWalkThreshold() : float {
		return quickTurnWalkThreshold;
	}
	
	public function getQuickTurnWalkSpeedReduction() : float {
		return quickTurnWalkSpeedReduction;
	}
	
	
	
	
	
	/////Sharp Turn
	
	public function sharpTurnDetectionEnabled() : bool {
		return sharpTurnDetection;
	}
	
	public function getSharpTurnDetectionThreshold() : float {
		return sharpTurnDetectionThreshold;
	}
	
	public function getSharpTurnDetectionTimer() : float {
		return sharpTurnDetectionTimer;
	}
	
	public function getDirectionSwitchTimeDelta() : float {
		return directionSwitchTimeDelta;
	}
	
	public function getDirectionSwitchEndLeniency() : float {
		return directionSwitchEndLeniency;
	}
	
	
	public function isDirectionSwitchForceWalk() : bool {
		return directionSwitchForceWalk;
	}
	
	public function getDirectionSwitchSpeedMultiplier() : float {
		return directionSwitchSpeedMultiplier;
	}
	
	
	
	////Misc
	public function getMaxTurnAngle() : float {
		return maxTurnAngle;
	}
	
	
	///Speed
	public function getSprintSpeedMultiplier() : float {
		return sprintSpeedMultiplier;
	}
	
	public function getSwimSpeedMultiplier() : float {
		return swimSpeedMultiplier;
	}
	
	public function getWalkSpeedMultiplier() : float {
		return walkSpeedMultiplier;
	}



	public final function firstTimeOptionSetup()
	{
		var s : string;
		var wrapper : CInGameConfigWrapper;
		
		wrapper = theGame.GetInGameConfigWrapper();
	
		
		if( !Initialized() )
		{
			wrapper.SetVarValue('BetterMovementStraight', 'TurnAdjustTimer', "0.1");
			wrapper.SetVarValue('BetterMovementStraight', 'SpeedMultiplier', "4.5");
			wrapper.SetVarValue('BetterMovementStraight', 'MaxTurnAngle', "120.0");
			
			wrapper.SetVarValue('BetterMovementQuick', 'QuickTurnWalkEnabled', true);
			wrapper.SetVarValue('BetterMovementQuick', 'QuickTurnWalkThreshold', "0.90");
			wrapper.SetVarValue('BetterMovementQuick', 'QuickTurnWalkSpeedReduction', "0.2");
			
			wrapper.SetVarValue('BetterMovementSharp', 'SharpTurnDetection', true);
			wrapper.SetVarValue('BetterMovementSharp', 'SharpTurnDetectionThreshold', "0.85");
			wrapper.SetVarValue('BetterMovementSharp', 'SharpTurnDetectionTimer', "0.3");
			
			wrapper.SetVarValue('BetterMovementSharp', 'DirectionSwitchTimeDelta', "0.6");
			wrapper.SetVarValue('BetterMovementSharp', 'DirectionSwitchEndLeniency', "0.4");
			
			wrapper.SetVarValue('BetterMovementSharp', 'DirectionSwitchForceWalk', false);
			wrapper.SetVarValue('BetterMovementSharp', 'DirectionSwitchSpeedMultiplier', "0.85");
			
			
			wrapper.SetVarValue('BetterMovementMisc', 'RunInCombatToggle', true);
			wrapper.SetVarValue('BetterMovementMisc', 'RealTime', false);
			
			wrapper.SetVarValue('BetterMovementSpeed', 'SprintSpeedMultiplier', "1.0");
			wrapper.SetVarValue('BetterMovementSpeed', 'SwimSpeedMultiplier', "1.0");
			wrapper.SetVarValue('BetterMovementSpeed', 'WalkSpeedMultiplier', "1.0");
			
			wrapper.SetVarValue('BetterMovementMisc', 'VersionNr', "1.21");
			theGame.SaveUserSettings();
			
		}
	}
	
	public function Initialized() : bool
	{
		return ( StringToFloat(theGame.GetInGameConfigWrapper().GetVarValue('BetterMovementMisc', 'VersionNr')) == 1.21 );
	}
	
	public function Init() : bool {
		firstTimeOptionSetup();
		readValues();
		return true;
	}
}
