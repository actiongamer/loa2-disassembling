package nslm2.modules.bag
{
   import com.mz.core.utils2.task.TaskBase;
   import com.netease.protobuf.UInt64;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.model.CardInfoModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.StringUtils;
   import morn.core.handlers.Handler;
   import proto.BagItemUseReq.UseInfo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.BagItemUseReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.ProtocolStatusRes;
   
   public class UseItemTask extends TaskBase
   {
       
      
      public var itemId:UInt64;
      
      public var stcItemId:int;
      
      public var count:int;
      
      public var choice:int;
      
      public var alertUseCost:Boolean;
      
      public function UseItemTask(param1:UInt64, param2:int, param3:int, param4:Boolean = true, param5:int = 0)
      {
         super();
         this.itemId = param1;
         this.stcItemId = param2;
         this.count = param3;
         this.choice = param5;
         this.alertUseCost = param4;
      }
      
      override public function exec() : void
      {
         var _loc2_:* = null;
         super.exec();
         var _loc1_:StcItemVo = StcMgr.ins.getItemVo(this.stcItemId);
         var _loc3_:* = _loc1_.kind;
         if(12 !== _loc3_)
         {
            if(10 !== _loc3_)
            {
               if(36 !== _loc3_)
               {
                  if(35 !== _loc3_)
                  {
                     if(alertUseCost && !StringUtils.isNull(_loc1_.use_cost))
                     {
                        AlertUtil.comfirm(new UseSingleCostAlert(_loc1_.use_cost,count),new Handler(toUse));
                     }
                     else
                     {
                        this.toUse();
                     }
                  }
               }
               _loc2_ = CardInfoModel.ins.itemIsUsing(_loc1_.kind);
               if(_loc2_)
               {
                  if(_loc1_.times > _loc2_.times)
                  {
                     AlertUtil.comfirm(LocaleMgr.ins.getStr(50500170,[LocaleMgr.ins.getStr(_loc1_.name),LocaleMgr.ins.getStr(_loc2_.name)]),toUse);
                  }
                  else if(_loc1_.times < _loc2_.times)
                  {
                     AlertUtil.alert(LocaleMgr.ins.getStr(50500171,[LocaleMgr.ins.getStr(_loc1_.name),LocaleMgr.ins.getStr(_loc2_.name)]));
                  }
                  else
                  {
                     toUse();
                  }
               }
            }
            addr138:
            return;
         }
         if(FuncOpenAutoCtrl.checkOpen(30200))
         {
            ModuleMgr.ins.showModule(30200,null,ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            AlertUtil.lackLevel(FuncOpenAutoCtrl.getOpenLevel(30200));
         }
         §§goto(addr138);
      }
      
      private function toUse() : void
      {
         var _loc2_:Array = [];
         var _loc6_:UseInfo = new UseInfo();
         var _loc5_:int = BagModel.ins.getItemById(itemId).itemId;
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(_loc5_);
         var _loc1_:int = 4022;
         _loc6_.itemId = this.itemId;
         _loc6_.count = this.count;
         _loc6_.choice = this.choice;
         _loc2_.push(_loc6_);
         var _loc4_:BagItemUseReq = new BagItemUseReq();
         _loc4_.info = _loc2_;
         if(_loc3_.kind == 1000)
         {
            ServerEngine.ins.send(10000,_loc4_);
            this.onComplete();
         }
         else
         {
            ServerEngine.ins.send(4022,_loc4_,new Handler(server_itemUse,[[_loc5_,count]]),server_itemUseErr);
         }
      }
      
      private function server_itemUse(param1:Array) : void
      {
         this.onComplete();
         ObserverMgr.ins.sendNotice("MSG_ITEM_USE_CPL",param1);
      }
      
      private function server_itemUseErr(param1:ProtocolStatusRes) : void
      {
         if(super.handlerBatch.hasType(74))
         {
            this.onError(param1.errCode);
         }
         else
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
   }
}
