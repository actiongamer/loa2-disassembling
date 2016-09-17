package nslm2.modules.foundations.recycle.view.panel
{
   import game.ui.recycleModules.RecycleConfirmPanelUI;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.recycle.service.RecycleService;
   import nslm2.modules.foundations.recycle.consts.RecycleConsts;
   import proto.RecycleHeroDecomposeRes;
   import nslm2.utils.WealthUtil;
   import proto.ProtocolStatusRes;
   import nslm2.nets.sockets.ServerEngine;
   import proto.RecycleBaowuDecomposeRes;
   import proto.RecycleEquipDecomposeRes;
   import proto.RecyclePetDecomposeRes;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class RecycleConfirmPanel extends RecycleConfirmPanelUI
   {
       
      
      private var model:RecycleModel;
      
      public function RecycleConfirmPanel()
      {
         model = RecycleModel.ins;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btnCancel.btn_cancel !== _loc2_)
         {
            if(btnOK.btn_ok === _loc2_)
            {
               onConfirm();
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function onConfirm() : void
      {
         ObserverMgr.ins.sendNotice("recycle_notice_confirm");
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         txt_alert.text = "";
         var _loc2_:* = model.crtFunctionType;
         if(0 !== _loc2_)
         {
            if(1 !== _loc2_)
            {
               if(2 !== _loc2_)
               {
                  if(3 !== _loc2_)
                  {
                     if(RecycleConsts.REC_TYPE_EQUIP_REBORN !== _loc2_)
                     {
                        if(RecycleConsts.REC_TYPE_TREASURE !== _loc2_)
                        {
                           if(7 === _loc2_)
                           {
                              panelBg.txt_titleName.text = LocaleMgr.ins.getStr(11300020);
                              RecycleService.ins.recyclePetReborn([model.selectedRebornItem.wealthVo.sid],false,gotPetRwdHandler,$errCallback,1);
                           }
                        }
                        else
                        {
                           panelBg.txt_titleName.text = LocaleMgr.ins.getStr(11300015);
                           RecycleService.ins.recycleTreasureReborn(model.selectedTreasureIdList,false,gotTreasureRwdHandler,$errCallback,1);
                        }
                     }
                     else
                     {
                        if(model.hasHighQualityItem)
                        {
                           txt_alert.text = LocaleMgr.ins.getStr(11300039);
                        }
                        panelBg.txt_titleName.text = LocaleMgr.ins.getStr(11300020);
                        RecycleService.ins.recycleEquipDecompose([model.selectedRebornItem.wealthVo.id],false,true,gotEquipRwdHandler,$errCallback);
                     }
                  }
                  else
                  {
                     panelBg.txt_titleName.text = LocaleMgr.ins.getStr(11300020);
                     RecycleService.ins.recycleTreasureReborn([model.selectedRebornItem.id],false,gotTreasureRwdHandler,$errCallback);
                  }
               }
               else
               {
                  panelBg.txt_titleName.text = LocaleMgr.ins.getStr(11300020);
                  RecycleService.ins.recycleHeroDecompose([model.selectedRebornItem.id],false,2,gotRwdHandler,$errCallback);
               }
            }
            else
            {
               if(model.hasHighQualityItem)
               {
                  txt_alert.text = LocaleMgr.ins.getStr(11300039);
               }
               if(model.hasOrangeEquip)
               {
                  txt_alert.text = LocaleMgr.ins.getStr(11300047);
               }
               panelBg.txt_titleName.text = LocaleMgr.ins.getStr(11300015);
               RecycleService.ins.recycleEquipDecompose(model.selectedEquipIdList,false,false,gotEquipRwdHandler,$errCallback);
            }
         }
         else
         {
            panelBg.txt_titleName.text = LocaleMgr.ins.getStr(11300015);
            if(model.hasHighQualityItem)
            {
               txt_alert.text = LocaleMgr.ins.getStr(11300038);
            }
            RecycleService.ins.recycleHeroDecompose(model.selectedHeroIdList,false,1,gotRwdHandler,$errCallback);
         }
      }
      
      private function gotRwdHandler(param1:RecycleHeroDecomposeRes) : void
      {
         if(param1)
         {
            list_item.dataSource = WealthUtil.rewardArrToWealthVoArr(param1.res);
         }
         else
         {
            list_item.dataSource = [];
         }
         this.moduleServerCpl();
      }
      
      private function $errCallback(param1:ProtocolStatusRes) : void
      {
         ServerEngine.ins.doDefaultErr(param1);
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function gotTreasureRwdHandler(param1:RecycleBaowuDecomposeRes) : void
      {
         if(param1)
         {
            list_item.dataSource = WealthUtil.rewardArrToWealthVoArr(param1.res);
         }
         else
         {
            list_item.dataSource = [];
         }
         this.moduleServerCpl();
      }
      
      private function gotEquipRwdHandler(param1:RecycleEquipDecomposeRes) : void
      {
         if(param1)
         {
            list_item.dataSource = WealthUtil.rewardArrToWealthVoArr(param1.res);
         }
         else
         {
            list_item.dataSource = [];
         }
         this.moduleServerCpl();
      }
      
      private function gotPetRwdHandler(param1:RecyclePetDecomposeRes) : void
      {
         if(param1)
         {
            list_item.dataSource = WealthUtil.rewardArrToWealthVoArr(param1.res);
         }
         else
         {
            list_item.dataSource = [];
         }
         this.moduleServerCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
   }
}
