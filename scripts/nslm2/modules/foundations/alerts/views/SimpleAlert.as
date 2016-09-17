package nslm2.modules.foundations.alerts.views
{
   import game.ui.alerts.SimpleAlertUI;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import flash.display.DisplayObject;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import proto.ArenaInfoRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.TimePriceUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class SimpleAlert extends SimpleAlertUI
   {
      
      public static const FRONT_NO_SHOW_KEY:String = "NO_SHOW_KEY_";
       
      
      public var vo:AlertMsgVo;
      
      public var contentYesHandler;
      
      public var contentNoHandler;
      
      public function SimpleAlert()
      {
         super();
         this.txt_content.size = 14;
         this.txt_content.isHtml = true;
         this.centerX = 0;
         this.centerY = 0;
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.moduleFadeInType = 0;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         this.panelBg.titleImgId = this.moduleId;
         this.vo = param1 as AlertMsgVo;
         if(vo.content is String)
         {
            this.txt_content.text = vo.content;
         }
         else
         {
            this.txt_content.visible = false;
            this.addChild(vo.content as DisplayObject);
            if(vo.content is IAlertContent)
            {
               (vo.content as IAlertContent).setAlert(this);
            }
         }
         if(vo.type == "simpleAlert" || vo.type == "alertTop")
         {
            DisplayUtils.removeSelf(this.box_canel);
         }
         if(vo.noShowKey || vo.noShowKey2)
         {
            cb_noShow.visible = true;
            cb_noShow.selected = false;
         }
         else
         {
            cb_noShow.visible = false;
         }
         if(vo.cancelStr)
         {
            this.box_canel.btn_cancel.label = vo.cancelStr;
         }
         if(vo.confirmStr)
         {
            this.box_ok.btn_ok.label = vo.confirmStr;
         }
         if(vo.vipHint > 0)
         {
            if(!int(App.languageAry.indexOf(App.language)))
            {
               _loc2_ = 30;
            }
            else
            {
               _loc2_ = 65;
            }
            addChild(new VipHintBox(vo.vipHint,_loc2_,105));
         }
         this.preShowCpl();
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.box_ok.btn_ok !== _loc3_)
         {
            if(this.box_canel.btn_cancel === _loc3_)
            {
               if(contentNoHandler)
               {
                  Handler.execute(contentYesHandler);
               }
               else
               {
                  onNo();
               }
            }
         }
         else if(contentYesHandler)
         {
            Handler.execute(contentYesHandler);
         }
         else
         {
            onYes();
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      public function onYes() : void
      {
         if(vo.closeFlg)
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
         if(vo.handler)
         {
            Handler.execute(vo.handler);
         }
         if(vo.noShowKey)
         {
            LocalData.insCurPlayer.save("NO_SHOW_KEY_" + vo.noShowKey,this.cb_noShow.selected);
         }
         if(vo.noShowKey2)
         {
            SettingModel.ins.setHintById(10900052 + vo.noShowKey2,!this.cb_noShow.selected);
         }
      }
      
      public function onNo() : void
      {
         btnCloseHandler(null);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
         if(vo.handlerOther)
         {
            Handler.execute(vo.handlerOther,[0]);
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["changeContentArena","changeContentStamina","changeContent","changeTitle"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:* = param1;
         if("changeTitle" !== _loc6_)
         {
            if("changeContentArena" !== _loc6_)
            {
               if("changeContentStamina" !== _loc6_)
               {
                  if("changeContent" === _loc6_)
                  {
                     _loc5_ = param2.buyKind;
                     _loc3_ = param2.vipLimitId;
                     this.vo.content = LocaleMgr.ins.getStr(50200012,[TimePriceUtil.curTimePriceVo(_loc5_).count]) + "\n" + LocaleMgr.ins.getStr(50200107,[TimePriceUtil.curTimes(_loc5_),int(VipModel.ins.getVipValue(_loc3_))]);
                  }
               }
               else
               {
                  this.vo.content = param2 as String;
               }
            }
            else
            {
               _loc4_ = param2 as ArenaInfoRes;
               this.vo.content = LocaleMgr.ins.getStr(50200012,[_loc4_.buyTimesDiamond]) + "\n" + LocaleMgr.ins.getStr(50200107,[_loc4_.buyTimesCount,int(VipModel.ins.getVipValue(10210))]);
            }
         }
         else
         {
            this.panelBg.txt_titleName.text = param2 as String;
         }
         this.txt_content.text = vo.content;
      }
   }
}
