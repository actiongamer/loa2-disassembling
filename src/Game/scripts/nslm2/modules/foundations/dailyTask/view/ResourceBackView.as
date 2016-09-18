package nslm2.modules.foundations.dailyTask.view
{
   import game.ui.dailyTaskModules.view.ResourceBackViewUI;
   import com.mz.core.interFace.IObserver;
   import proto.RetrivalInfoRes;
   import nslm2.mgrs.stcMgrs.vos.StcSourceRetrivalVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import proto.MapKey32ValueReward;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.MapKey32Value32;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.model.PlayerModel;
   import proto.RetrivalRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.customs.expands.MornExpandUtil;
   
   public class ResourceBackView extends ResourceBackViewUI implements IObserver
   {
      
      public static var OPT_RESOURCE_BACK_REFRESH_LIST:String = "OPT_RESOURCE_BACK_REFRESH_LIST";
      
      private static var res_one_key:int = 30121;
       
      
      private var res:RetrivalInfoRes;
      
      private var vo:StcSourceRetrivalVo;
      
      private var arr:Array;
      
      private var kind:int = 0;
      
      public function ResourceBackView()
      {
         super();
         this.img_bg.skin = UrlLib.getResBackUrl("img_bg.jpg");
         this.img_icon_gold.skin = UrlLib.itemMiniIcon(1);
         this.img_icon_diamond.skin = UrlLib.itemMiniIcon(3);
         this.list_item.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         MornExpandUtil.addHandlerForBtnAll(this,onClick);
         TaskModel.ins.reqResourceBack();
         ObserverMgr.ins.regObserver(this);
         this.btn_allgold.label = LocaleMgr.ins.getStr(109000017);
         this.btn_alldiamond.label = LocaleMgr.ins.getStr(109000018);
         this.txt_tip1.text = LocaleMgr.ins.getStr(109000019);
         this.txt_tip2.text = LocaleMgr.ins.getStr(109000020);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         ObserverMgr.ins.unregObserver(this);
      }
      
      private function onInfoRet(param1:RetrivalInfoRes) : void
      {
         var _loc9_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc8_:Boolean = false;
         this.res = param1;
         arr = [];
         var _loc4_:Array = StcMgr.ins.getSourceRetrivalTable().array;
         _loc9_ = 0;
         while(_loc9_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc9_];
            if(FuncOpenAutoCtrl.checkOpen(_loc2_.id))
            {
               arr.push({
                  "key":_loc2_.id,
                  "curNum":0,
                  "maxNum":0,
                  "reward":[],
                  "sort":_loc2_.sort
               });
            }
            _loc9_++;
         }
         if(param1)
         {
            var _loc11_:int = 0;
            var _loc10_:* = param1.res;
            for each(var _loc7_ in param1.res)
            {
               _loc3_ = StcMgr.ins.getSourceRetrivalTable();
               _loc6_ = StcMgr.ins.getSourceRetrivalVo(_loc7_.key);
               _loc5_ = {
                  "key":_loc7_.key,
                  "reward":_loc7_.value,
                  "curNum":getCurNum(_loc7_.key),
                  "maxNum":getMaxNum(_loc7_.key),
                  "sort":_loc6_.sort
               };
               _loc8_ = false;
               _loc9_ = 0;
               while(_loc9_ < arr.length)
               {
                  if(arr[_loc9_].key == _loc7_.key)
                  {
                     arr[_loc9_] = _loc5_;
                     _loc8_ = true;
                     break;
                  }
                  _loc9_++;
               }
               if(_loc8_ == false)
               {
                  arr.push(_loc5_);
               }
            }
         }
         arr.sortOn("sort");
         list_item.array = arr;
         this.btn_allgold.disabled = !TaskModel.ins.hasResBackReward;
         this.btn_alldiamond.disabled = !TaskModel.ins.hasResBackReward;
         this.vo = StcMgr.ins.getSourceRetrivalVo(res_one_key);
         this.txt_tip0.text = LocaleMgr.ins.getStr(109000016,[vo.gold_per * 100 + "%",vo.diamond_per * 100 + "%"]);
      }
      
      public function getFocusNotices() : Array
      {
         return [OPT_RESOURCE_BACK_REFRESH_LIST,"TASK_NOTICE_UPDATE_RESOURCE_BACK"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if(OPT_RESOURCE_BACK_REFRESH_LIST !== _loc3_)
         {
            if("TASK_NOTICE_UPDATE_RESOURCE_BACK" === _loc3_)
            {
               onInfoRet(TaskModel.ins.resourceBackRes);
            }
         }
         else
         {
            TaskModel.ins.reqResourceBack();
         }
      }
      
      private function getCurNum(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < res.nowNum.length)
         {
            _loc2_ = res.nowNum[_loc3_];
            if(_loc2_.key == param1)
            {
               return _loc2_.value;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function getMaxNum(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < res.num.length)
         {
            _loc2_ = res.num[_loc3_];
            if(param1 == _loc2_.key)
            {
               return _loc2_.value;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function onClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_allgold !== _loc3_)
         {
            if(this.btn_alldiamond === _loc3_)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(109000045,[getAllDiamPrice()]),alldiamgoNext,null,null);
            }
         }
         else
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(109000044,[getAllGoldPrice()]),allgoldgoNext,null,null);
         }
      }
      
      private function allgoldgoNext() : void
      {
         var _loc1_:* = null;
         if(PlayerModel.ins.gold < getAllGoldPrice())
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300004040));
         }
         else
         {
            _loc1_ = new RetrivalRewardReq();
            _loc1_.id = 0;
            _loc1_.kind = 1;
            kind = _loc1_.kind;
            ServerEngine.ins.send(5371,_loc1_,onRewardRet);
         }
      }
      
      private function alldiamgoNext() : void
      {
         var _loc1_:* = null;
         if(PlayerModel.ins.diamond < getAllDiamPrice())
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300004041));
         }
         else
         {
            _loc1_ = new RetrivalRewardReq();
            _loc1_.id = 0;
            _loc1_.kind = 2;
            kind = _loc1_.kind;
            ServerEngine.ins.send(5371,_loc1_,onRewardRet);
         }
      }
      
      private function getAllGoldPrice() : int
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < arr.length)
         {
            if(arr[_loc4_].curNum == 0)
            {
               _loc3_ = StcMgr.ins.getSourceRetrivalVo(arr[_loc4_].key);
               _loc2_ = WealthVo.parseCostStr(_loc3_.gold_price);
               _loc1_ = _loc1_ + _loc2_.count * arr[_loc4_].maxNum;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function getAllDiamPrice() : int
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc4_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < arr.length)
         {
            if(arr[_loc3_].curNum == 0)
            {
               _loc2_ = StcMgr.ins.getSourceRetrivalVo(arr[_loc3_].key);
               _loc1_ = WealthVo.parseCostStr(_loc2_.diamond_price);
               _loc4_ = _loc4_ + _loc1_.count * arr[_loc3_].maxNum;
            }
            _loc3_++;
         }
         return _loc4_;
      }
      
      private function onRewardRet() : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < arr.length)
         {
            if(arr[_loc5_].curNum == 0)
            {
               _loc4_ = WealthUtil.rewardArrToWealthVoArr(arr[_loc5_].reward);
               _loc3_ = 0;
               while(_loc3_ < _loc4_.length)
               {
                  _loc1_ = _loc4_[_loc3_];
                  if(kind == 1)
                  {
                     _loc1_.count = _loc1_.count * (vo.gold_per * arr[_loc5_].maxNum);
                  }
                  else
                  {
                     _loc1_.count = _loc1_.count * (vo.diamond_per * arr[_loc5_].maxNum);
                  }
                  _loc2_.push(_loc1_);
                  _loc3_++;
               }
            }
            _loc5_++;
         }
         TweenLite.delayedCall(0.8,FloatUtil.showGetItemsDisplayPanel,[_loc2_]);
         TaskModel.ins.reqResourceBack();
      }
   }
}
