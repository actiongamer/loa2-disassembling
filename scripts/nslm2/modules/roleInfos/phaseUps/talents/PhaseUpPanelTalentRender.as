package nslm2.modules.roleInfos.phaseUps.talents
{
   import game.ui.commons.icons.PhaseUpTalentRenderSize50UI;
   import morn.core.components.Label;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentInfoVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class PhaseUpPanelTalentRender extends PhaseUpTalentRenderSize50UI
   {
       
      
      private var txt_canLvUp:Label;
      
      private var _selectEffect:BmcSpriteSheet;
      
      public function PhaseUpPanelTalentRender()
      {
         super();
         this.addEventListener("click",onClick);
      }
      
      override protected function validateImgIcon() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         super.validateImgIcon();
         if(this.vo)
         {
            _loc1_ = StcMgr.ins.getHeroTalentInfoVo(this.stcTablentId);
            _loc3_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent_info",["node","lv"],[_loc1_.node,this.vo.lv + 1]) as StcHeroTalentInfoVo;
            if(_loc3_)
            {
               _loc2_ = WealthVo.parseCostStr(_loc1_.cost);
               if(vo.heroPhaseLv >= _loc1_.cond)
               {
                  if(PlayerModel.ins.getCountByWealthVo(_loc2_) >= _loc2_.count)
                  {
                     this.switchCanLvUp(true,true);
                  }
                  else
                  {
                     this.switchCanLvUp(false,true);
                  }
               }
               else
               {
                  this.switchCanLvUp(false,true);
               }
            }
            else
            {
               this.switchCanLvUp(false,false);
            }
         }
      }
      
      private function switchCanLvUp(param1:Boolean, param2:Boolean) : void
      {
         if(param1)
         {
            if(txt_canLvUp == null)
            {
               txt_canLvUp = new Label();
               this.addChild(txt_canLvUp);
               txt_canLvUp.mouseEvent = false;
               var _loc3_:int = 0;
               txt_canLvUp.centerY = _loc3_;
               txt_canLvUp.centerX = _loc3_;
               txt_canLvUp.style = "普通绿色";
               txt_canLvUp.text = LocaleMgr.ins.getStr(30113000);
            }
            if(!_selectEffect)
            {
               _selectEffect = new BmcSpriteSheet();
               _selectEffect.init(1152,1,"all",true);
               _selectEffect.x = -10;
               _selectEffect.y = -12;
               _selectEffect.scale = 0.9;
               this.addChild(_selectEffect);
            }
            _selectEffect.visible = true;
            txt_canLvUp.visible = true;
         }
         else
         {
            if(txt_canLvUp != null)
            {
               txt_canLvUp.visible = false;
            }
            if(_selectEffect != null)
            {
               _selectEffect.visible = false;
            }
         }
         this.buttonMode = param2;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.buttonMode)
         {
            ModuleMgr.ins.showModule(30113,this.vo,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      override public function dispose() : void
      {
         this.removeEventListener("click",onClick);
         if(txt_canLvUp != null)
         {
            txt_canLvUp.dispose();
            txt_canLvUp = null;
         }
         if(_selectEffect != null)
         {
            _selectEffect.dispose();
            _selectEffect = null;
         }
         super.dispose();
      }
   }
}
