package nslm2.modules.battles.battle
{
   import com.mz.core.utils2.reflects.ReflectUtil;
   
   public class InitCCReplacer
   {
       
      
      public function InitCCReplacer()
      {
         super();
         var _loc1_:* = ReflectUtil.getClass("cc.BattleMgr.CModule");
         SocketEngine.CModule = _loc1_;
         _loc1_ = _loc1_;
         CCEngine.CModule = _loc1_;
         FPUtil.CModule = _loc1_;
         _loc1_ = ReflectUtil.getClass("BattleMgr");
         SocketEngine.BattleMgr = _loc1_;
         CCEngine.BattleMgr = _loc1_;
         _loc1_ = ReflectUtil.getClass("Battle_DefineValue");
         SocketEngine.Battle_DefineValue = _loc1_;
         CCEngine.Battle_DefineValue = _loc1_;
         _loc1_ = ReflectUtil.getClass("Skill_DataValue");
         SocketEngine.Skill_DataValue = _loc1_;
         CCEngine.Skill_DataValue = _loc1_;
         _loc1_ = ReflectUtil.getClass("Skill_Effect_DataValue");
         SocketEngine.Skill_Effect_DataValue = _loc1_;
         CCEngine.Skill_Effect_DataValue = _loc1_;
         _loc1_ = ReflectUtil.getClass("Buff_DataValue");
         SocketEngine.Buff_DataValue = _loc1_;
         CCEngine.Buff_DataValue = _loc1_;
         _loc1_ = ReflectUtil.getClass("Player_DataValue");
         SocketEngine.Player_DataValue = _loc1_;
         CCEngine.Player_DataValue = _loc1_;
         _loc1_ = ReflectUtil.getClass("Battle_ParamValue");
         SocketEngine.Battle_ParamValue = _loc1_;
         CCEngine.Battle_ParamValue = _loc1_;
         _loc1_ = ReflectUtil.getClass("Skill_Time_PointValue");
         SocketEngine.Skill_Time_PointValue = _loc1_;
         CCEngine.Skill_Time_PointValue = _loc1_;
         _loc1_ = ReflectUtil.getClass("Action_DataValue");
         SocketEngine.Action_DataValue = _loc1_;
         CCEngine.Action_DataValue = _loc1_;
         _loc1_ = ReflectUtil.getClass("Battle_ResultValue");
         SocketEngine.Battle_ResultValue = _loc1_;
         CCEngine.Battle_ResultValue = _loc1_;
         _loc1_ = ReflectUtil.getClass("ccengine").cRam;
         SocketEngine.ram = _loc1_;
         CCEngine.ram = _loc1_;
      }
   }
}
