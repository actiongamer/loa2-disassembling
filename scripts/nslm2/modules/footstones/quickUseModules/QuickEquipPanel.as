package nslm2.modules.footstones.quickUseModules
{
   import game.ui.quickUseModules.QuickEquipPanelUI;
   import proto.Item;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.ServerTimer;
   import com.greensock.TweenLite;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.HeroInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class QuickEquipPanel extends QuickEquipPanelUI implements IQuickUse
   {
       
      
      private var _item:Item;
      
      public function QuickEquipPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function get vo() : WealthVo
      {
         return WealthUtil.itemToVo(_item);
      }
      
      public function show(param1:Item) : void
      {
         _item = param1;
         this.render_item.dataSource = vo;
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(_item.itemId);
         switch(int(_loc2_.kind) - 10)
         {
            case 0:
               this.txt_title.text = LocaleMgr.ins.getStr(999000594);
               this.btn_confirm.label = LocaleMgr.ins.getStr(999000597);
               break;
            case 1:
            case 2:
               this.txt_title.text = LocaleMgr.ins.getStr(999000595);
               this.btn_confirm.label = LocaleMgr.ins.getStr(999000597);
         }
         this.btn_confirm.mouseEnabled = false;
         if(QuickUseModel.ins.lastClickedStamp + 1 - ServerTimer.ins.second > 0)
         {
            TweenLite.delayedCall(QuickUseModel.ins.lastClickedStamp + 1 - ServerTimer.ins.second,enableMouse);
         }
         else
         {
            this.btn_confirm.mouseEnabled = true;
         }
      }
      
      private function enableMouse() : void
      {
         this.btn_confirm.mouseEnabled = true;
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_confirm === _loc4_)
         {
            if(ServerTimer.ins.second < QuickUseModel.ins.lastClickedStamp + 1)
            {
               return;
            }
            _loc2_ = StcMgr.ins.getItemVo(_item.itemId);
            switch(int(_loc2_.kind) - 10)
            {
               case 0:
                  ModuleMgr.ins.showModule(30200);
                  break;
               case 1:
               case 2:
                  ModuleMgr.ins.showModule(30300);
            }
            QuickUseModel.ins.lastClickedStamp = ServerTimer.ins.second;
            QuickUseModel.ins.removeQuickUseById(_item.id);
            ObserverMgr.ins.sendNotice("msgShowNextItem");
         }
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(enableMouse);
         super.dispose();
      }
   }
}
