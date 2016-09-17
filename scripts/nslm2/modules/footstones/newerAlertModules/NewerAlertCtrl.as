package nslm2.modules.footstones.newerAlertModules
{
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.scenes.shenYuans.service.ShenYuanService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchNewerAlertMsg;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils.ArrayUtil;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.utils.ServerTimer;
   import nslm2.common.globals.GlobalRef;
   
   public class NewerAlertCtrl implements IObserver, IDispose
   {
      
      private static var _ins:nslm2.modules.footstones.newerAlertModules.NewerAlertCtrl;
       
      
      private var _funIdArr:Array;
      
      private var _showingFuncId:int;
      
      public function NewerAlertCtrl()
      {
         _funIdArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.newerAlertModules.NewerAlertCtrl
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.newerAlertModules.NewerAlertCtrl();
         }
         return _ins;
      }
      
      public function init() : void
      {
         if(FuncOpenAutoCtrl.checkOpen(41500) == true)
         {
            ShenYuanService.ins.requestBaseInfo();
         }
         ObserverMgr.ins.regObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["msgSwitchNewerAlert","msgDeleteNewerAlert","msgChangeNewerAlertShow"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Boolean = false;
         var _loc6_:* = param1;
         if("msgSwitchNewerAlert" !== _loc6_)
         {
            if("msgDeleteNewerAlert" !== _loc6_)
            {
               if("msgChangeNewerAlertShow" === _loc6_)
               {
                  _loc3_ = param2 as Boolean;
                  if(_loc3_)
                  {
                     TimerManager.ins.doOnce(1000,checkShow);
                  }
                  else
                  {
                     TimerManager.ins.clearTimer(checkShow);
                  }
               }
            }
            else
            {
               ArrayUtil.removeItem(_funIdArr,param2 as int);
               if(_showingFuncId == param2 as int)
               {
                  ModuleMgr.ins.closeModule(96400);
               }
            }
         }
         else
         {
            _loc4_ = param2 as SwitchNewerAlertMsg;
            _loc5_ = _loc4_.moduleId;
            if(_loc4_.vis)
            {
               if(_funIdArr.indexOf(_loc5_) == -1)
               {
                  _funIdArr.push(_loc5_);
               }
               checkShow();
            }
            else
            {
               if(ModuleMgr.ins.isShow(96400) == true && _showingFuncId == _loc5_)
               {
                  ModuleMgr.ins.closeModule(96400);
               }
               ArrayUtil.removeItem(_funIdArr,_loc5_);
               if(ModuleMgr.ins.isShow(40200) == true)
               {
                  return;
               }
               NewerAlertModel.ins.removeNewerGuideIdByFunId(_loc5_);
            }
         }
      }
      
      public function checkShow() : void
      {
         if(ModuleMgr.ins.isShow(40200) == true)
         {
            return;
         }
         if(ModuleMgr.ins.isShow(96400) == false && (NGUtil.curStcVo == null || NGUtil.curStcVo && NGUtil.curStcVo.is_unlock != 0) && ServerTimer.ins.second > GlobalRef.mainCityReshowParam.newerAlertCanShowStamp && NewerAlertModel.ins.canShowNewerAlert == true)
         {
            filterArr();
            if(_funIdArr.length > 0)
            {
               _showingFuncId = _funIdArr[0];
               trace(_showingFuncId + " ___ " + NewerAlertModel.ins.canShowNewerTupoAlert);
               if(FuncOpenAutoCtrl.checkOpen(96400))
               {
                  trace("功能开启了！");
                  if(!(_showingFuncId == 30110 && NewerAlertModel.ins.canShowNewerTupoAlert == false))
                  {
                     if(NewerAlertConsts.FIGHT_VALUE_ALERT_ARRAY.indexOf(_showingFuncId) != -1)
                     {
                        NewerAlertModel.ins.nextCanShowStampDict.put(_showingFuncId,ServerTimer.ins.second + 600);
                     }
                     ModuleMgr.ins.showModule(96400,_showingFuncId);
                  }
               }
               else
               {
                  trace("功能尚未开启！");
               }
            }
         }
      }
      
      private function filterArr() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = _funIdArr.length;
         var _loc2_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            if(NewerAlertModel.ins.checkInLevel(_funIdArr[_loc3_]))
            {
               _loc2_.push(_funIdArr[_loc3_]);
            }
            _loc3_++;
         }
         _funIdArr = _loc2_;
      }
      
      public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
      }
   }
}
