package nslm2.modules.foundations.firstCharge.chargeTips
{
   import game.ui.firstChargeModule.chargeTips.ChargeTipModuleUI;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.greensock.TweenLite;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.foundations.mall.vo.MallParamVo;
   
   public class ChargeTipModule extends ChargeTipModuleUI
   {
       
      
      private var kind:int;
      
      public function ChargeTipModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.y = 190;
         this.x = -250;
         kind = param1 as int;
         this.cb_again.selected = false;
         this.addChildAt(ChargeTipUtils.createPage(kind),0);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.btn_goto.addEventListener("click",btn_gotoHandler);
         this.btn_goto.label = LocaleMgr.ins.getStr(999000236);
         TweenLite.to(this,1,{"x":36});
         if(this.parent)
         {
            this.parent.setChildIndex(this,0);
         }
         super.preShow(param1);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_close === _loc3_)
         {
            if(this.cb_again.selected)
            {
               ChargeTipUtils.setNoShowAgain(this.kind);
            }
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function btn_gotoHandler(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         switch(int(kind) - 1)
         {
            case 0:
            case 1:
            case 2:
               ModuleMgr.ins.showModule(60200);
               break;
            case 3:
            case 4:
               ModuleMgr.ins.showModule(60530);
               break;
            case 5:
               ModuleMgr.ins.showModule(10800);
               break;
            case 6:
               _loc3_ = ServerTimer.ins.date.date;
               if(ServerTimer.ins.openServerDate == _loc3_)
               {
                  ModuleMgr.ins.showModule(11200);
               }
               else
               {
                  _loc2_ = new MallParamVo(1,0);
                  ModuleMgr.ins.showModule(11200,_loc2_);
               }
               break;
            case 7:
               _loc2_ = new MallParamVo(1,0);
               ModuleMgr.ins.showModule(11200,_loc2_);
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
