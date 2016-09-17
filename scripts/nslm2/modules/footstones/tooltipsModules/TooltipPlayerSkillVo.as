package nslm2.modules.footstones.tooltipsModules
{
   public class TooltipPlayerSkillVo
   {
       
      
      public var usingNorSkillId:uint;
      
      public var usingSpeSkillId:uint;
      
      public var usingAuraSkillId:uint;
      
      public function TooltipPlayerSkillVo(param1:uint = 0, param2:uint = 0, param3:uint = 0)
      {
         super();
         usingNorSkillId = param1;
         usingSpeSkillId = param2;
         usingAuraSkillId = param3;
      }
   }
}
