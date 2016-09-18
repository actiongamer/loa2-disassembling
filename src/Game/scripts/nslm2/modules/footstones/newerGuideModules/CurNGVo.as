package nslm2.modules.footstones.newerGuideModules
{
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import morn.core.components.Component;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class CurNGVo
   {
       
      
      private var _stcVo:StcGuideVo;
      
      public var isShow:Boolean;
      
      private var _arrowParent:Component;
      
      private var _triggerContainer:Component;
      
      public var comp:Component;
      
      public function CurNGVo()
      {
         super();
      }
      
      public function get triggerContainer() : Component
      {
         return _triggerContainer;
      }
      
      public function set triggerContainer(param1:Component) : void
      {
         _triggerContainer = param1;
      }
      
      public function get arrowParent() : Component
      {
         return _arrowParent;
      }
      
      public function set arrowParent(param1:Component) : void
      {
         _arrowParent = param1;
      }
      
      public function set stcVo(param1:StcGuideVo) : void
      {
         _stcVo = param1;
         if(param1 == null || param1.is_unlock != 0)
         {
            ObserverMgr.ins.sendNotice("msgChangeNewerAlertShow",true);
            ObserverMgr.ins.sendNotice("msgChangeQuickUseShow",true);
         }
         else
         {
            ObserverMgr.ins.sendNotice("msgChangeNewerAlertShow",false);
            ObserverMgr.ins.sendNotice("msgChangeQuickUseShow",false);
         }
      }
      
      public function get stcVo() : StcGuideVo
      {
         return _stcVo;
      }
   }
}
