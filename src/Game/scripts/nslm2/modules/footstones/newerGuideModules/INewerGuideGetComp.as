package nslm2.modules.footstones.newerGuideModules
{
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   
   public interface INewerGuideGetComp
   {
       
      
      function getCompById(param1:String, param2:StcGuideVo) : Component;
   }
}
