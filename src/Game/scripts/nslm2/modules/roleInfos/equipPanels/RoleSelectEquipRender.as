package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleSelectEquipRenderUI;
   import morn.core.components.Label;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.model.HeroModel;
   import proto.Item;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.WealthUtil;
   import proto.BaoWu;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import nslm2.modules.footstones.tooltipsModules.TooltipCompareVo;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class RoleSelectEquipRender extends RoleSelectEquipRenderUI
   {
       
      
      private var starNum:Label;
      
      public function RoleSelectEquipRender()
      {
         starNum = new Label();
         super();
         this.parts.push(new RollHighLightMediator(this));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         img_arrow.visible = false;
         img_mengyue.visible = false;
         box_lvl.visible = false;
         list_stars.visible = false;
         starNum.visible = false;
         .super.dataSource = param1;
         var _loc4_:int = RoleInfoModel.ins.heroInfo.baseInfo.baseId;
         if(ClientConfig.isRuLang())
         {
            this.txt_name.x = this.txt_name.x + (this.txt_name.width - 75) / 2;
            this.txt_name.width = 75;
            this.txt_name.y = 44;
            this.txt_name.height = 40;
            this.txt_name.multiline = true;
            this.txt_name.wordWrap = true;
         }
         if(wealthVo.item)
         {
            _loc3_ = HeroModel.ins.getEquipedItemByKind(wealthVo.stcItemVo.kind);
         }
         if(wealthVo.item && Uint64Util.equal(wealthVo.item.id,BagModel.ins.firstEquipId))
         {
            if(!_loc3_)
            {
               img_arrow.visible = true;
            }
            else
            {
               img_arrow.visible = wealthVo.item && WealthUtil.compareEquipOrTreausre(_loc3_.itemId,wealthVo.item.itemId,_loc4_);
            }
         }
         if(wealthVo.treasure)
         {
            _loc2_ = HeroModel.ins.getEquipedTreasureByKind(wealthVo.treasure);
         }
         if(wealthVo.treasure && Uint64Util.equal(wealthVo.treasure.id,TreasureModel.ins.firstTreasureID))
         {
            if(!_loc2_)
            {
               img_arrow.visible = true;
            }
            else
            {
               img_arrow.visible = wealthVo.treasure && WealthUtil.compareEquipOrTreausre(_loc2_.baseId,wealthVo.treasure.baseId,_loc4_);
            }
         }
         if(wealthVo.item && WealthUtil.isMengYueEquipOrTreasure(_loc4_,wealthVo.sid) && Uint64Util.equal(wealthVo.item.id,BagModel.ins.firstEquipId))
         {
            img_mengyue.visible = true;
            img_arrow.visible = false;
         }
         if(wealthVo.treasure && WealthUtil.isMengYueEquipOrTreasure(_loc4_,wealthVo.sid,true) && Uint64Util.equal(wealthVo.treasure.id,TreasureModel.ins.firstTreasureID))
         {
            img_mengyue.visible = true;
            img_arrow.visible = false;
         }
         if(wealthVo.item)
         {
            box_lvl.visible = true;
            _loc5_ = StcMgr.ins.getEquipStrengthVo(wealthVo.item.strengthId);
            if(_loc5_)
            {
               txt_lvl.text = _loc5_.level + "";
            }
            else
            {
               txt_lvl.text = "0";
            }
         }
         if(wealthVo.treasure)
         {
            box_lvl.visible = true;
            txt_lvl.text = wealthVo.treasure.level + "";
         }
         WealthUtil.changeQualitySkin(this.img_lvlBg,wealthVo.quality);
      }
      
      override protected function validateQuality() : void
      {
         super.validateQuality();
         if(this.ref_img_quality.visible == false)
         {
            this.ref_img_quality.skin = this.ori_img_quality_skin + 0;
            this.ref_img_quality.visible = true;
         }
      }
      
      override protected function validateTooltip() : void
      {
         if(wealthVo && wealthVo.kind != 0)
         {
            if(wealthVo.item && HeroModel.ins.getEquipedItemByKind(wealthVo.stcItemVo.kind))
            {
               this.toolTip = new TooltipCompareVo(wealthVo,WealthUtil.itemToVo(HeroModel.ins.getEquipedItemByKind(wealthVo.stcItemVo.kind)));
            }
            else if(wealthVo.treasure && HeroModel.ins.getEquipedTreasureByKind(wealthVo.treasure))
            {
               this.toolTip = new TooltipCompareVo(wealthVo,WealthUtil.treasureToVo(HeroModel.ins.getEquipedTreasureByKind(wealthVo.treasure)));
            }
            else
            {
               this.toolTip = new TooltipCompareVo(wealthVo);
            }
         }
         else
         {
            this.toolTip = null;
         }
      }
   }
}
