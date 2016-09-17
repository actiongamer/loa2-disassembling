package nslm2.modules.footstones.getItemsDisplayModule
{
   import game.ui.getItemsDisplayModules.GetItemsDisplayModuleUI;
   import nslm2.modules.footstones.getItemsDisplayModule.vo.GetItemDisplayModuleParam;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comps2d.others.ClickToNext;
   import flash.events.Event;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class GetItemsDisplayModule extends GetItemsDisplayModuleUI
   {
       
      
      private var param:GetItemDisplayModuleParam;
      
      private var eff:BmcSpriteSheet;
      
      public function GetItemsDisplayModule()
      {
         super();
         moduleFadeInType = 2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         param = param1 as GetItemDisplayModuleParam;
         if(param)
         {
            if(param.items == null)
            {
               param.items = [];
            }
            if(param.titleTxt)
            {
               txt_title.text = param.titleTxt;
            }
            else
            {
               txt_title.text = LocaleMgr.ins.getStr(999000109);
            }
            if(param.items.length <= 10)
            {
               list_items.y = 78;
               list_items.repeatX = param.items.length;
               list_items.repeatY = 1;
            }
            else
            {
               list_items.y = 78;
               list_items.repeatX = 10;
               list_items.repeatY = Math.ceil(param.items.length / 10);
               img_bg.height = img_bg.height + (list_items.repeatY - 1) * 80;
               img_bg.width = 960;
               closeComp.y = img_bg.height - 50;
               this.y = UIMgr.gameHeight - img_bg.height >> 1;
               commitMeasure();
            }
            if(param.vipHintFuncId > 0)
            {
               this.label_buff.visible = true;
               this.label_buff.text = LocaleMgr.ins.getStr(30100344,[int(VipModel.ins.getVipValue(10420))]);
               addChild(new VipHintBox(param.vipHintFuncId,300,176));
            }
            list_items.dataSource = param.items;
            list_items.x = this.width - list_items.width >> 1;
            eff = new BmcSpriteSheet();
            eff.x = 287;
            eff.y = 9 + (list_items.repeatY - 1) * 37;
            eff.init(1015007,1,"all",true);
            DisplayUtils.addChildBelow(eff,list_items);
            if(param.showDoubleTip)
            {
               _loc3_ = param.showDoubleTip.split(",");
               _loc2_ = new ActivityDoubleTip(_loc3_[0],_loc3_.length > 1?_loc3_[1]:null);
               this.addChild(_loc2_);
               _loc2_.x = 286;
               _loc2_.y = 57;
            }
         }
         if(!param || param.autoHide)
         {
            TweenLite.delayedCall(1,fadeOut);
         }
         this.closeComp.visible = false;
         TweenLite.delayedCall(1,this.preShowCpl,null,true);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         (this.closeComp as ClickToNext).addHandler(fadeOut);
      }
      
      private function fadeOut(param1:Event = null) : void
      {
         disposeOthers();
         var _loc2_:ListIconFlyEff = new ListIconFlyEff(list_items);
         if(param.getIconFlyPosFunction != null)
         {
            _loc2_.set_getToTargetHandler(param.getIconFlyPosFunction);
         }
         _loc2_.exec();
         var _loc3_:Number = list_items.length * 0.15;
         _loc3_ = _loc3_ > 0.8?0.8:Number(_loc3_);
         TweenLite.delayedCall(_loc3_,closeMe);
      }
      
      private function closeMe() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         NGUtil.checkOtherModuleShow();
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function disposeOthers() : void
      {
         if(eff)
         {
            eff.dispose();
            eff = null;
         }
         TweenLite.killDelayedCallsTo(fadeOut);
         (this.closeComp as ClickToNext).dispose();
      }
      
      override public function preClose(param1:Object = null) : void
      {
         disposeOthers();
         TweenLite.killDelayedCallsTo(closeMe);
         super.preClose(null);
      }
      
      override public function close(param1:Object = null) : void
      {
         disposeOthers();
         TweenLite.killDelayedCallsTo(closeMe);
         super.close();
      }
   }
}
