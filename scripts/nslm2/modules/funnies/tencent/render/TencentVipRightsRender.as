package nslm2.modules.funnies.tencent.render
{
   import game.ui.TencentModule.render.TencentVipRightsRenderUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.funnies.tencent.consts.QQVipUtils;
   
   public class TencentVipRightsRender extends TencentVipRightsRenderUI
   {
       
      
      public function TencentVipRightsRender()
      {
         super();
         this.buttonMode = true;
         this.addEventListener("click",onClick);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.img_bg.skin = UrlLib.getTencentImg("img_view" + (this.listCellVo.dataIndex + 1));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = this.listCellVo.dataIndex + 1;
         if(1 !== _loc2_)
         {
            if(2 !== _loc2_)
            {
               if(3 !== _loc2_)
               {
                  if(4 !== _loc2_)
                  {
                     if(5 !== _loc2_)
                     {
                        if(6 === _loc2_)
                        {
                           QQVipUtils.toOffical();
                        }
                     }
                     else
                     {
                        ObserverMgr.ins.sendNotice("MSG_QQ_VIP_TAB_CHANGE",60713);
                     }
                  }
                  else
                  {
                     ObserverMgr.ins.sendNotice("MSG_QQ_VIP_TAB_CHANGE",60712);
                  }
               }
               else
               {
                  VipModel.ins.gotoCharge();
               }
            }
            else
            {
               ObserverMgr.ins.sendNotice("MSG_QQ_VIP_TAB_CHANGE",60714);
            }
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_QQ_VIP_TAB_CHANGE",60714);
         }
      }
   }
}
