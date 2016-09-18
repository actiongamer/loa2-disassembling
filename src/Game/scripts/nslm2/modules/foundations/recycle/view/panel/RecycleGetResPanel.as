package nslm2.modules.foundations.recycle.view.panel
{
   import game.ui.recycleModules.RecycleGetResPanelUI;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import nslm2.modules.foundations.recycle.consts.RecycleConsts;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.mgrs.UIMgr;
   import com.greensock.TweenLite;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import morn.customs.components.WealthRender;
   import flash.events.MouseEvent;
   
   public class RecycleGetResPanel extends RecycleGetResPanelUI
   {
       
      
      public function RecycleGetResPanel()
      {
         super();
      }
      
      public function show(param1:Object) : void
      {
         var _loc3_:* = RecycleModel.ins.crtFunctionType;
         if(0 !== _loc3_)
         {
            if(1 !== _loc3_)
            {
               if(RecycleConsts.REC_TYPE_TREASURE !== _loc3_)
               {
                  if(2 !== _loc3_)
                  {
                     if(3 !== _loc3_)
                     {
                        if(7 !== _loc3_)
                        {
                        }
                     }
                     addr16:
                     txt_title.text = "重生获得：";
                  }
                  §§goto(addr16);
               }
               addr40:
               if(param1.length <= 8)
               {
                  list_item.y = 75;
                  list_item.repeatX = param1.length;
                  list_item.repeatY = 1;
                  clickTip.y = 190;
               }
               else
               {
                  list_item.y = 46;
                  list_item.repeatX = param1.length / 2;
                  list_item.repeatY = 2;
                  clickTip.y = 221;
               }
               list_item.x = this.width - list_item.width >> 1;
               list_item.dataSource = param1;
               var _loc2_:int = 11300040 + MathUtil.randomInt(6,2);
               fadeIn();
               UIMgr.stage.addEventListener("click",fadeOut);
               return;
            }
            addr9:
            txt_title.text = "分解获得：";
            §§goto(addr40);
         }
         §§goto(addr9);
      }
      
      public function fadeIn() : void
      {
         TweenLite.from(this,0.3,{
            "alpha":0,
            "y":this.y + 50
         });
         TweenLite.delayedCall(5,fadeOut);
      }
      
      private function getToTargetHandler(param1:ListIconFlyEff, param2:WealthRender) : *
      {
         if(param2.wealthVoIsEnable)
         {
            switch(int(param2.wealthVo.kind) - 12)
            {
               case 0:
                  return RecycleModel.ins.resIcon;
               default:
               default:
                  return ListIconFlyEff.getToTargetFromWealthRender(param1,param2);
               case 3:
                  return RecycleModel.ins.resIcon;
            }
         }
         else
         {
            return null;
         }
      }
      
      private function fadeOut(param1:MouseEvent = null) : void
      {
         TweenLite.killDelayedCallsTo(fadeOut);
         UIMgr.stage.removeEventListener("click",fadeOut);
         new ListIconFlyEff(this.list_item).set_getToTargetHandler(getToTargetHandler).exec();
         TweenLite.to(this,0.3,{
            "alpha":0,
            "y":this.y - 50,
            "onComplete":dispose
         });
      }
   }
}
