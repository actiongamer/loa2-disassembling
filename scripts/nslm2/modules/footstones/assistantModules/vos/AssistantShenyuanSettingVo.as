package nslm2.modules.footstones.assistantModules.vos
{
   public class AssistantShenyuanSettingVo
   {
       
      
      public var openMysteryBoxCnt:uint = 0;
      
      public var needOpenBox:Boolean;
      
      public var needGetRankReward:Boolean = true;
      
      public var buyBuffArr:Array;
      
      public function AssistantShenyuanSettingVo()
      {
         buyBuffArr = [];
         super();
      }
   }
}
