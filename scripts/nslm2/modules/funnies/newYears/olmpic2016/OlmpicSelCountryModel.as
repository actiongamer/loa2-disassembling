package nslm2.modules.funnies.newYears.olmpic2016
{
   import flash.events.EventDispatcher;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import flash.events.Event;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class OlmpicSelCountryModel extends EventDispatcher
   {
      
      public static const MY_COUNTRY_CHANGE:String = "myCountryChange";
      
      private static var _ins:nslm2.modules.funnies.newYears.olmpic2016.OlmpicSelCountryModel;
       
      
      private var _selCountry:int = -1;
      
      private var hasAutoShow:Boolean = false;
      
      public function OlmpicSelCountryModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.newYears.olmpic2016.OlmpicSelCountryModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.newYears.olmpic2016.OlmpicSelCountryModel();
         }
         return _ins;
      }
      
      public function isOpen() : Boolean
      {
         var _loc3_:StcFunctionVo = StcMgr.ins.getFunctionVo(9900004);
         if(_loc3_ && _loc3_.isopen == 0)
         {
            return false;
         }
         var _loc1_:String = "2016-08-05 00:00:00";
         var _loc2_:String = "2016-08-21 00:00:00";
         return ServerTimer.ins.isNowInFormStr(_loc1_,_loc2_);
      }
      
      public function set selCountry(param1:int) : void
      {
         if(isOpen() == false)
         {
            return;
         }
         if(_selCountry != param1)
         {
            _selCountry = param1;
            if(param1 == 0 && PKCrossModel.ins.info && PKCrossModel.ins.info.status == 1)
            {
               ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(9900004,true));
            }
            else
            {
               ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(9900004,false));
            }
            dispatchEvent(new Event("myCountryChange"));
         }
      }
      
      public function get selCountry() : int
      {
         return _selCountry;
      }
      
      public function autoShow() : void
      {
         if(hasAutoShow == false && isOpen() && _selCountry == 0 && PKCrossModel.ins.info && PKCrossModel.ins.info.status == 1)
         {
            ModuleMgr.ins.showModule(9900004);
         }
         hasAutoShow = true;
      }
   }
}
