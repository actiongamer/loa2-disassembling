package nslm2.modules.footstones.newerGuideModules
{
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   
   public interface INewerGuideCheckHandler
   {
       
      
      function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int;
   }
}
