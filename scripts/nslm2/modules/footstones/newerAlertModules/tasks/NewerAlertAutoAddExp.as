package nslm2.modules.footstones.newerAlertModules.tasks
{
   import com.mz.core.utils2.task.TaskBase;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import proto.HeroInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.mgrs.stcMgrs.vos.StcLevelVo;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import proto.HeroAddExpReq;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.nets.sockets.ServerEngine;
   import proto.HeroAddExpRes;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.globals.GlobalRef;
   
   public class NewerAlertAutoAddExp extends TaskBase
   {
       
      
      private var _lastAddExpHero:HeroInfo;
      
      private var _addExpReqArr:Array;
      
      private var _levelUpedHeroIdArr:Array;
      
      public function NewerAlertAutoAddExp(param1:Object = null)
      {
         _addExpReqArr = [];
         _levelUpedHeroIdArr = [];
         super(param1);
      }
      
      override public function exec() : void
      {
         super.exec();
         NewerAlertModel.ins.isAutoAddExping = true;
         autoAddExp();
      }
      
      private function autoAddExp() : void
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc12_:* = null;
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc8_:int = 0;
         var _loc3_:int = 0;
         var _loc13_:int = 0;
         var _loc10_:int = 0;
         var _loc14_:* = null;
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         var _loc4_:Array = StcMgr.ins.getVoArrByColumnValue("static_item","kind",32).sortOn("quality",16);
         var _loc11_:Vector.<HeroInfo> = HeroModel.ins.getPositionHeros();
         var _loc9_:int = _loc11_.length;
         var _loc6_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_.push(BagModel.ins.getStcCount(_loc4_[_loc5_].id));
            _loc5_++;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc12_ = _loc11_[_loc7_];
            if(!PlayerModel.ins.isCurPlayer(_loc12_.baseInfo.id))
            {
               _loc1_ = HeroInfoUtil.getLevelVo(_loc12_.baseInfo,_loc12_.baseInfo.level);
               _loc2_ = HeroInfoUtil.getLevelVo(_loc12_.baseInfo,PlayerModel.ins.level);
               _loc8_ = _loc2_.all_exp - Uint64Util.toNumber(_loc12_.baseInfo.exp) - _loc1_.all_exp;
               _loc3_ = 0;
               while(_loc3_ < _loc4_.length)
               {
                  _loc13_ = _loc6_[_loc3_];
                  if(_loc13_ > 0 && _loc8_ > 0)
                  {
                     _loc10_ = Math.min(Math.ceil(_loc8_ / int((_loc4_[_loc3_] as StcItemVo).extend_1)),_loc13_);
                     if(_loc10_ != 0)
                     {
                        _loc14_ = new HeroAddExpReq();
                        _loc14_.item = BagModel.ins.stcItemIdToItemArr(_loc4_[_loc3_].id)[0].id;
                        _loc14_.num = _loc10_;
                        _loc14_.hero = _loc12_.baseInfo.id;
                        _loc8_ = _loc8_ - _loc10_ * int((_loc4_[_loc3_] as StcItemVo).extend_1);
                        var _loc15_:* = _loc3_;
                        var _loc16_:* = _loc6_[_loc15_] - _loc10_;
                        _loc6_[_loc15_] = _loc16_;
                        _addExpReqArr.push(_loc14_);
                        _lastAddExpHero = _loc12_;
                     }
                  }
                  _loc3_++;
               }
            }
            _loc7_++;
         }
         if(_addExpReqArr.length > 0)
         {
            TimerManager.ins.doOnce(100,beginSendAddExpReq);
         }
      }
      
      private function beginSendAddExpReq() : void
      {
         var _loc1_:* = null;
         if(_addExpReqArr.length > 0)
         {
            _loc1_ = _addExpReqArr.shift();
            ServerEngine.ins.send(5001,_loc1_,server_heroAddExp);
         }
      }
      
      private function server_heroAddExp(param1:HeroAddExpRes) : void
      {
         addLevelUpedHero(param1);
         if(_addExpReqArr.length > 0)
         {
            TimerManager.ins.doOnce(100,beginSendAddExpReq);
         }
         else
         {
            ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
            NewerAlertModel.ins.isAutoAddExping = false;
            ObserverMgr.ins.sendNotice("msg_role_select_changed",_lastAddExpHero);
            showFloatResult();
            NewerAlertModel.ins.checkCanTupo();
         }
      }
      
      private function addLevelUpedHero(param1:HeroAddExpRes) : void
      {
         if(Uint64Util.indexOfArray(_levelUpedHeroIdArr,param1.hero) == -1)
         {
            _levelUpedHeroIdArr.push(param1.hero);
         }
      }
      
      private function showFloatResult() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:int = _levelUpedHeroIdArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = HeroModel.ins.getHeroInfoImmediate(_levelUpedHeroIdArr[_loc4_]);
            _loc2_ = StcMgr.ins.getNpcVo(_loc3_.baseInfo.baseId);
            if(_loc2_)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(_loc2_.name) + LocaleMgr.ins.getStr(30100101,[_loc3_.baseInfo.level]),null,-1,null,DisplayUtils.globarCenter(GlobalRef.bottomModuleBtns.heroIcon));
            }
            _loc4_++;
         }
         this.onComplete();
      }
   }
}
