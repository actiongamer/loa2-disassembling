package nslm2.modules.funnies.renZhengs.vipAuths
{
   import game.ui.renzhengs.vipAuths.VipAuthXunLeiModuleUI;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import morn.core.utils.URLUtils;
   
   public class VipAuthXunLeiModule extends VipAuthXunLeiModuleUI
   {
       
      
      public function VipAuthXunLeiModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = "";
         DisplayUtils.addChildBelow(this.img_bg,this.panelBg.btn_close);
         this.btn_submit.label = LocaleMgr.ins.getStr(60600304);
         this.txt_tip3.text = LocaleMgr.ins.getStr(60600401);
         this.txt_tip0.text = LocaleMgr.ins.getStr(60600402);
         this.txt_tip1.text = LocaleMgr.ins.getStr(60600403) + "\n" + LocaleMgr.ins.getStr(60600404) + "\n" + LocaleMgr.ins.getStr(60600405);
         this.txt_tipQQ0.text = LocaleMgr.ins.getStr(60600408);
         this.txt_tipQQ1.text = LocaleMgr.ins.getStr(60600406);
         this.btn_go.label = LocaleMgr.ins.getStr(60600407);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         if(VipModel.ins.currentDiamond < 8000)
         {
            this.txt_tipQQ0.visible = true;
            this.txt_tipQQ1.visible = false;
            this.btn_go.visible = false;
         }
         else
         {
            this.txt_tipQQ0.visible = false;
            this.txt_tipQQ1.visible = true;
            this.btn_go.visible = true;
         }
         super.preShow(param1);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_submit !== _loc3_)
         {
            if(this.btn_go === _loc3_)
            {
               URLUtils.openWindow("http://wpa.b.qq.com/cgi/wpa.php?ln=1&key=XzgwMDA1MTU1MV8yMzI1NDFfODAwMDUxNTUxXzJf");
            }
         }
         else
         {
            VipModel.ins.gotoCharge();
         }
      }
   }
}
