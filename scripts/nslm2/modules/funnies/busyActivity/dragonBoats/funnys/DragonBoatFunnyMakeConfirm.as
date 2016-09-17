package nslm2.modules.funnies.busyActivity.dragonBoats.funnys
{
   import game.ui.busyActivity.dragonBoats.funnys.DragonBoatFunnyMakeConfirmUI;
   import nslm2.common.ui.components.comps2d.numBar.NumBarS1;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import proto.StaticDragonBoatMakeModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.Event;
   import nslm2.utils.LabelMed;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import com.mz.core.logging.Log;
   import proto.DragonBoatOneKeyMakeRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.alerts.FloatUtil;
   
   public class DragonBoatFunnyMakeConfirm extends DragonBoatFunnyMakeConfirmUI
   {
      
      public static const noShowKey:String = "DragonBoatFunnyMakeConfirm.noShowKey";
       
      
      private var vo:StaticDragonBoatMakeModel;
      
      private var makeProductVo:WealthVo;
      
      private var materialVoArr:Array;
      
      public function DragonBoatFunnyMakeConfirm()
      {
         super();
      }
      
      public function get numBar() : NumBarS1
      {
         return this.numBarUI as NumBarS1;
      }
      
      public function get service() : DragonBoatService
      {
         return DragonBoatService.ins;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(13376020);
         vo = param1[0];
         this.makeProductVo = WealthUtil.createItemVo(vo.id,1);
         this.txt_tip1.text = LocaleMgr.ins.getStr(133760201,[vo.id]);
         if(vo.cookNum > 0)
         {
            this.numBar.init(1,vo.cookNum - this.service.getNumByMakeId(vo.id),1,1);
         }
         else
         {
            this.numBar.init(1,100,1,1);
         }
         this.cb_autoBuy.selected = param1[1];
         this.txt_tip2.text = LocaleMgr.ins.getStr(13376022);
         this.btn_get.label = LocaleMgr.ins.getStr(13376012);
         this.render_cost.mouseEvent = false;
         this.render_cost.visible = false;
         materialVoArr = vo.cookMaterialVoArr;
         this.list_meterial.repeatX = materialVoArr.length;
         this.txt_cost.visible = this.cb_autoBuy.selected;
         numBar_change(null);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.cb_autoBuy.label = LocaleMgr.ins.getStr(13376011);
         super.preShow(param1);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get !== _loc3_)
         {
            if(this.cb_autoBuy === _loc3_)
            {
               cb_autoBuy_change();
            }
         }
         else
         {
            server_make();
         }
      }
      
      private function cb_autoBuy_change() : void
      {
         this.txt_cost.visible = this.cb_autoBuy.selected;
         if(this.cb_autoBuy.selected)
         {
            this.numBar_change(null);
         }
         ObserverMgr.ins.sendNotice("DragonBoatService.MSG_SWITCH_CB_AUTO_BUY",this.cb_autoBuy.selected);
      }
      
      private function numBar_change(param1:Event) : void
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         this.refreshMaterial();
         this.refreshScore();
         if(cb_autoBuy.selected)
         {
            if(canMakeCount < this.numBar.nowNum)
            {
               _loc5_ = [];
               _loc3_ = this.needCount();
               _loc4_ = _loc3_.length;
               _loc6_ = 0;
               while(_loc6_ < _loc4_)
               {
                  _loc2_ = _loc3_[_loc6_];
                  _loc5_.push(LabelMed.wealthParam(_loc2_.kind,_loc2_.sid,_loc2_.count,0));
                  _loc6_++;
               }
               this.txt_cost.text = LocaleMgr.ins.getStr(13376029,["\n" + _loc5_.join("+")]);
            }
            else
            {
               this.txt_cost.text = "";
            }
         }
      }
      
      private function refreshMaterial() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = [];
         var _loc3_:int = this.materialVoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.materialVoArr[_loc4_];
            _loc2_ = _loc2_.clone();
            _loc2_.count = _loc2_.count * this.numBar.nowNum;
            _loc1_.push(_loc2_);
            _loc4_++;
         }
         this.list_meterial.array = _loc1_;
      }
      
      private function refreshScore() : void
      {
         this.txt_tip3.text = LocaleMgr.ins.getStr(13376023) + TextFieldUtil.htmlText2(String(vo.cookScore * this.numBar.nowNum),458496);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.numBar.addEventListener("evt_numbar_value_change",numBar_change);
         }
         else
         {
            this.numBar.removeEventListener("evt_numbar_value_change",numBar_change);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
      
      private function server_make() : void
      {
         if(canMakeCount < this.numBar.nowNum)
         {
            if(this.cb_autoBuy.selected)
            {
               AlertUtil.comfirm(this.txt_cost.text,this.server_make_alert_yes,null,"DragonBoatFunnyMakeConfirm.noShowKey");
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(300004042));
            }
         }
         else
         {
            this.server_make_alert_yes();
         }
      }
      
      private function get canMakeCount() : int
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = 2147483647;
         var _loc3_:int = this.materialVoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = this.materialVoArr[_loc4_];
            _loc2_ = Math.min(Math.floor(_loc1_.hadCount / _loc1_.need),_loc2_);
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function needCount() : Array
      {
         var _loc7_:int = 0;
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc3_:Array = [];
         var _loc5_:int = this.materialVoArr.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc1_ = this.materialVoArr[_loc7_];
            if(_loc1_.kind == 20)
            {
               _loc4_ = _loc1_.need * this.numBar.nowNum - _loc1_.hadCount;
               _loc4_ = Math.max(_loc4_,0);
               if(_loc4_ > 0)
               {
                  _loc2_ = StcMgr.ins.getVoByColumnValue("static_shop","sell_res",_loc1_.kind + ":" + _loc1_.sid + ":" + 1);
                  if(_loc2_)
                  {
                     _loc6_ = WealthUtil.parseCostStrToArr(_loc2_.curr_res);
                     needCount_addShopPriceArr(_loc3_,_loc6_,_loc4_);
                  }
                  else
                  {
                     Log.debug(this,"没有找到商店卖啊",_loc1_.sid);
                  }
               }
            }
            else
            {
               needCount_addShopPrice(_loc3_,_loc1_.clone(),this.numBar.nowNum);
            }
            _loc7_++;
         }
         return _loc3_;
      }
      
      private function needCount_addShopPriceArr(param1:Array, param2:Array, param3:int) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param2.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param2[_loc6_];
            needCount_addShopPrice(param1,_loc4_,param3);
            _loc6_++;
         }
      }
      
      private function needCount_addShopPrice(param1:Array, param2:WealthVo, param3:int) : void
      {
         param2.count = param2.count * param3;
         var _loc4_:int = WealthUtil.indexOfKindSid(param1,param2.kind,param2.sid);
         if(_loc4_ == -1)
         {
            param1.push(param2);
         }
         else
         {
            (param1[_loc4_] as WealthVo).count = (param1[_loc4_] as WealthVo).count + param2.count;
         }
      }
      
      private function server_make_alert_yes() : void
      {
         this.service.protos.server_DRAGON_BOAT_ONE_KEY_MAKE(this.vo.id,this.cb_autoBuy.selected,this.numBar.nowNum,server_makeCpl);
      }
      
      private function server_makeCpl(param1:uint, param2:Boolean, param3:uint, param4:DragonBoatOneKeyMakeRes, param5:ServerEvent) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
         FloatUtil.displayPlayerDataChange(param5.dataNotifyCacheVo);
      }
   }
}
