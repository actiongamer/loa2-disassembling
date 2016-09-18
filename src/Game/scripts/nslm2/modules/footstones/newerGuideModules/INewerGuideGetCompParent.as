package nslm2.modules.footstones.newerGuideModules
{
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   
   public interface INewerGuideGetCompParent
   {
       
      
      function getCompParentById(param1:StcGuideVo) : Component;
   }
}
