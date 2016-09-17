package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.comp.TreasureSelectorRenderUI;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import flash.events.MouseEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.mediators.RollHighLightMediator;
   import com.mz.core.configs.ClientConfig;
   
   public class TreasureSelectorRender extends TreasureSelectorRenderUI
   {
       
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      public function TreasureSelectorRender()
      {
         super();
         this.box_equip.addEventListener("click",clickIconHandler);
         box_equip.buttonMode = true;
         img_bgSelected.visible = false;
         this.parts.push(new RollHighLightMediator(this,img_bg));
         if(ClientConfig.isRuLang())
         {
            this.txt_name.size = 10;
         }
      }
      
      protected function clickIconHandler(param1:MouseEvent) : void
      {
         btnClickHandler(null);
      }
      
      override protected function validateTooltip() : void
      {
         if(wealthVo && wealthVo.kind != 0)
         {
            this.img_icon.toolTip = WealthUtil.tooltip(wealthVo);
         }
         else
         {
            this.img_icon.toolTip = null;
         }
      }
      
      override public function get wealthVo() : WealthVo
      {
         return (dataSource as HeroEquipVo).wealthVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         .super.dataSource = param1;
         if(!wealthVo.treasure)
         {
            if(TreasureModel.ins.hasTreasureInBg(dataSource.place))
            {
               if(!flickerTxtExpPre)
               {
                  flickerTxtExpPre = new FlickerEffCtrl(img_plus,1);
               }
               flickerTxtExpPre.resume();
               img_plus.visible = true;
            }
            else
            {
               removePlus();
            }
            img_redPoint.visible = false;
            list_stars.visible = false;
            box_starCnt.visible = false;
            this.txt_fuwenkeyin.visible = false;
         }
         else
         {
            img_redPoint.visible = TreasureModel.ins.hasBetterTreasure(wealthVo);
            removePlus();
            _loc2_ = TreasureUtil.pareseTreasureRuneArr(wealthVo.treasure.fumo,wealthVo.treasure.baseId);
            _loc3_ = TreasureUtil.getMaxOpenHoleCnt(wealthVo.treasure.baseId);
            _loc2_.length = _loc3_;
            list_rune.dataSource = _loc2_;
            if(wealthVo.treasure.keyin > 5)
            {
               box_starCnt.visible = true;
               list_stars.visible = false;
               txt_starCnt.text = "x" + wealthVo.treasure.keyin;
            }
            else
            {
               box_starCnt.visible = false;
               if(wealthVo.treasure.keyin > 0)
               {
                  list_stars.visible = true;
                  list_stars.dataSource = TreasureModel.getStarLightArray(wealthVo.treasure.keyin);
               }
               else
               {
                  list_stars.visible = false;
               }
            }
            if(FuncOpenAutoCtrl.checkOpen(30616))
            {
               this.txt_fuwenkeyin.text = LocaleMgr.ins.getStr(30616017,[int(wealthVo.treasure.fuwenkeyin / 10),wealthVo.treasure.fuwenkeyin % 10]);
               this.txt_fuwenkeyin.visible = true;
            }
            else
            {
               this.txt_fuwenkeyin.visible = false;
            }
         }
      }
      
      override protected function validateListStars() : void
      {
      }
      
      private function removePlus() : void
      {
         if(flickerTxtExpPre)
         {
            flickerTxtExpPre.dispose();
         }
         img_plus.visible = false;
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         img_bgSelected.visible = param1 == 3;
      }
      
      private function btnClickHandler(param1:Object) : void
      {
         if(TreasureModel.ins.hasTreasureInBg((dataSource as HeroEquipVo).place))
         {
            ObserverMgr.ins.sendNotice("treasure_show_selecte_treasure_panel",[box_equip,dataSource]);
         }
         else
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.TREASURE_LESS_ID)),30600);
         }
      }
      
      override protected function validateTxtName() : void
      {
         var _loc1_:int = 0;
         if(this.ref_txt_name != null)
         {
            if(wealthVo && wealthVo.treasure)
            {
               this.ref_txt_name.color = ColorLib.qualityColor(wealthVo.quality);
               this.ref_txt_name.text = wealthVo.showName;
               this.ref_txt_name.visible = true;
               _loc1_ = wealthVo.treasure.level;
               txt_stren.text = LocaleMgr.ins.getStr(300004043) + "+" + _loc1_;
               this.ref_img_icon.visible = true;
               this.ref_txt_name.visible = true;
               list_rune.dataSource = [null,null,null,null,null,null];
            }
            else
            {
               img_equipIcon.skin = "png.a5.commonImgs.img_equipRenderBgSmall" + (dataSource as HeroEquipVo).place;
               this.ref_img_icon.visible = false;
               this.ref_txt_name.visible = false;
               txt_stren.text = "";
               list_rune.dataSource = [];
            }
         }
      }
   }
}
