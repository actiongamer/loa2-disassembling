package nslm2.modules.footstones.tooltipsModules
{
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   
   public class TooltipNpcSkillVo
   {
       
      
      public var skillID:Array;
      
      public var npcVO:StcNpcVo;
      
      public function TooltipNpcSkillVo()
      {
         skillID = [];
         super();
      }
   }
}
