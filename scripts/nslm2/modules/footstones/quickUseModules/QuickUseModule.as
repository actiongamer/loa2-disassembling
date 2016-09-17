package nslm2.modules.footstones.quickUseModules
{
   import game.ui.quickUseModules.QuickUseModuleUI;
   import morn.core.components.ViewStack;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.Item;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import morn.core.components.Button;
   import com.mz.core.mgrs.ObserverMgr;
   import com.greensock.TweenLite;
   import morn.customs.expands.MornExpandUtil;
   
   public class QuickUseModule extends QuickUseModuleUI
   {
       
      
      private var subViewStack:ViewStack;
      
      private var _itemId:UInt64;
      
      public function QuickUseModule()
      {
         super();
         ObserverMgr.ins.regObserver(this);
         this.bottom = 230;
         this.right = 82;
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         subViewStack = new ViewStack();
         subViewStack.subViewClasses = QuickUseConsts.subViewStackPanelArr;
         subViewStack.y = 20;
         subViewStack.x = 1;
         this.box_content.addChild(subViewStack);
         _itemId = param1 as UInt64;
         var _loc2_:Item = BagModel.ins.getItemById(_itemId);
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(_loc2_.itemId);
         subViewStack.selectedIndex = QuickUseModel.ins.getIndexByBagType(_loc3_.kind);
         (subViewStack.selection as IQuickUse).show(_loc2_);
         this.box_content.alpha = 0;
         this.box_content.y = 50;
         this.preShowCpl();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_close === _loc2_)
         {
            QuickUseModel.ins.removeQuickUseSameId(_itemId);
            ObserverMgr.ins.sendNotice("msgShowNextItem");
         }
      }
      
      override public function fadeIn(param1:Number = 0, param2:int = 0) : void
      {
         super.fadeIn(param1,param2);
         TweenLite.to(this.box_content,0.2,{
            "y":0,
            "alpha":1
         });
      }
      
      override public function fadeOut() : void
      {
         super.fadeOut();
         TweenLite.killTweensOf(this.box_content);
         TweenLite.to(this.box_content,0.2,{
            "y":50,
            "alpha":0
         });
      }
   }
}
