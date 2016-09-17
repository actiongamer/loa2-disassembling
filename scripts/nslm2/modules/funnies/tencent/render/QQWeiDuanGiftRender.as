package nslm2.modules.funnies.tencent.render
{
   import game.ui.TencentModule.render.QQWeiDuanGiftRenderUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.funnies.tencent.model.QQWeiDuanGiftService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.customs.expands.MornExpandUtil;
   
   public class QQWeiDuanGiftRender extends QQWeiDuanGiftRenderUI
   {
       
      
      public function QQWeiDuanGiftRender()
      {
         super();
         this.txt_ok.text = LocaleMgr.ins.getStr(60730204);
         this.txt_title1.text = LocaleMgr.ins.getStr(60730001);
         this.txt_title2.text = LocaleMgr.ins.getStr(60730002);
         this.txt_title3.text = LocaleMgr.ins.getStr(60730003);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:* = param1;
         if(this.btn_check !== _loc4_)
         {
            if(this.btn_get === _loc4_)
            {
               QQWeiDuanGiftService.ins.server_weiDuanGetReward(int(this.dataSource),server_getHandler);
            }
         }
         else if(this.kind != 1)
         {
            _loc3_ = QQWeiDuanGiftService.ins.toSetAuto();
            if(_loc3_)
            {
               this.box_ok.visible = true;
               this.box_no.visible = false;
               AlertUtil.float(LocaleMgr.ins.getStr(999000491));
               this.refreshBtn(true);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999000492));
            }
         }
      }
      
      private function server_getHandler() : void
      {
         this.refreshBtn(true);
      }
      
      public function get kind() : int
      {
         return this.dataSource as int;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:Boolean = false;
         .super.dataSource = param1;
         if(kind)
         {
            this.txt_name.text = LocaleMgr.ins.getStr(60730100 + this.kind);
            this.list_gift.array = WealthUtil.costStrToArr(DefindConsts.QQ_CLIENT_DOWNLOAD(kind));
            switch(int(kind) - 1)
            {
               case 0:
                  if(QQWeiDuanGiftService.ins.checkIsFromWeiDuan())
                  {
                     this.box_ok.visible = true;
                     this.box_no.visible = false;
                     _loc2_ = true;
                  }
                  else
                  {
                     this.box_ok.visible = false;
                     this.box_no.visible = true;
                     this.txt_no.text = LocaleMgr.ins.getStr(999000493);
                     this.btn_check.visible = true;
                     this.btn_check.label = LocaleMgr.ins.getStr(999000494);
                     _loc2_ = false;
                  }
                  break;
               case 1:
                  if(QQWeiDuanGiftService.ins.checkIsSetAuto())
                  {
                     this.box_ok.visible = true;
                     this.box_no.visible = false;
                     _loc2_ = true;
                  }
                  else
                  {
                     this.box_ok.visible = false;
                     this.box_no.visible = true;
                     this.txt_no.text = LocaleMgr.ins.getStr(60730202);
                     this.btn_check.visible = true;
                     this.btn_check.label = LocaleMgr.ins.getStr(60730205);
                     _loc2_ = false;
                  }
                  break;
               case 2:
                  if(QQWeiDuanGiftService.ins.checkIsFromAuto())
                  {
                     this.box_ok.visible = true;
                     this.box_no.visible = false;
                     _loc2_ = true;
                     break;
                  }
                  this.box_ok.visible = false;
                  this.box_no.visible = true;
                  this.txt_no.text = LocaleMgr.ins.getStr(60730203);
                  this.btn_check.visible = false;
                  _loc2_ = false;
                  break;
            }
         }
         this.refreshBtn(_loc2_);
      }
      
      private function refreshBtn(param1:Boolean) : void
      {
         if(QQWeiDuanGiftService.ins.hadGet(this.kind))
         {
            this.btn_get.label = LocaleMgr.ins.getStr(10600041);
            this.btn_get.disabled = true;
         }
         else
         {
            this.btn_get.label = LocaleMgr.ins.getStr(41300099);
            this.btn_get.disabled = !param1;
         }
      }
   }
}
