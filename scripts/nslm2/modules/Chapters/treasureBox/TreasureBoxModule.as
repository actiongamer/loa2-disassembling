package nslm2.modules.Chapters.treasureBox
{
   import game.ui.chapters.TreasureBoxModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.modules.Chapters.TreasureBoxModuleVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import flash.events.MouseEvent;
   import morn.core.handlers.Handler;
   import morn.core.components.Button;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import morn.customs.expands.MornExpandUtil;
   
   public class TreasureBoxModule extends TreasureBoxModuleUI implements INewerGuideCheckHandler
   {
       
      
      private var _closeHandler;
      
      private var _rewardHandler;
      
      private var _preState:int;
      
      private var _vo:TreasureBoxModuleVo;
      
      public function TreasureBoxModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnClick);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _vo = param1 as TreasureBoxModuleVo;
         this.img_hasReward.visible = false;
         setView(_vo.data);
         _closeHandler = _vo.closeHandler;
         _rewardHandler = _vo.rewardHandler;
         this.panelBg.titleImgId = this.moduleId;
         this.preShowCpl();
      }
      
      private function setView(param1:TreasureBoxVo) : void
      {
         if(param1.optionData)
         {
            if(param1.optionData is String)
            {
               this.txt_des.text = param1.optionData;
            }
            else
            {
               this.txt_des.text = "";
               this.addChildAt(param1.optionData,3);
            }
         }
         this.list_item.dataSource = param1.itemArr;
         this.list_item.repeatX = param1.itemArr.length;
         this.list_item.commitMeasure();
         this.list_item.x = (this.width - this.list_item.width) / 2;
         switch(int(param1.state) - 1)
         {
            case 0:
               this.btn_confirm.visible = false;
               this.btn_cancel.visible = true;
               this.img_hasReward.visible = false;
               break;
            case 1:
               this.btn_confirm.visible = true;
               this.btn_cancel.visible = false;
               this.img_hasReward.visible = false;
               break;
            case 2:
               this.btn_confirm.visible = false;
               this.btn_cancel.visible = true;
               this.img_hasReward.visible = param1.showIcon;
               if(_preState == 2)
               {
                  FloatUtil.showGetItemsDisplayPanel(this.list_item.dataSource as Array,null,null,_vo.parentModuleId);
                  TweenLite.delayedCall(0.5,closeMe);
                  break;
               }
         }
         _preState = param1.state;
      }
      
      private function closeMe() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
         NGUtil.checkOtherModuleShow();
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("evtModuleRefresh" === _loc3_)
         {
            setView(param2 as TreasureBoxVo);
         }
         super.handleNotices(param1,param2);
      }
      
      override public function getFocusNotices() : Array
      {
         return ["evtModuleRefresh"];
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(_closeHandler)
         {
            Handler.execute(_closeHandler);
         }
         super.btnCloseHandler(param1);
      }
      
      private function onBtnClick(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_confirm !== _loc2_)
         {
            if(this.btn_cancel === _loc2_)
            {
               ModuleMgr.ins.closeModule(this.moduleId);
               if(_closeHandler)
               {
                  Handler.execute(_closeHandler);
               }
            }
         }
         else if(_rewardHandler)
         {
            Handler.execute(_rewardHandler);
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         if(!(int(param1) - 10063))
         {
            if(this.btn_confirm.visible == false)
            {
               return 0;
            }
         }
         return 1;
      }
   }
}
