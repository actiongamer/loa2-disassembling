package morn.customs.components
{
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.HeroModel;
   import nslm2.utils.LabelMed;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.tooltipsModules.ToolTipNpcCarrerVo;
   import nslm2.modules.footstones.tooltipsModules.ToolTipNpcGroupVo;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   
   public class PlayerTitleRender extends PlayerTitleRenderUI
   {
       
      
      private var _showLevel:Boolean = true;
      
      private var _name:String;
      
      private var _playerLevel:uint;
      
      private var _military:int = -1;
      
      private var _heroLevel:uint = 1;
      
      public var isShowTitleName:Boolean = false;
      
      public function PlayerTitleRender()
      {
         super();
      }
      
      public function get heroInfo() : HeroInfo
      {
         return dataSource as HeroInfo;
      }
      
      public function set heroInfo(param1:HeroInfo) : void
      {
         this.dataSource = param1;
      }
      
      public function get stcNpcVo() : StcNpcVo
      {
         return dataSource as StcNpcVo;
      }
      
      public function set stcNpcVo(param1:StcNpcVo) : void
      {
         this.dataSource = param1;
      }
      
      public function setName(param1:String) : PlayerTitleRender
      {
         _name = param1;
         return this;
      }
      
      public function setPlayerLevel(param1:uint) : PlayerTitleRender
      {
         _playerLevel = param1;
         return this;
      }
      
      public function setMilitary(param1:uint) : PlayerTitleRender
      {
         _military = param1;
         return this;
      }
      
      public function showLevel(param1:Boolean) : PlayerTitleRender
      {
         _showLevel = param1;
         return this;
      }
      
      public function setHeroLevel(param1:uint) : PlayerTitleRender
      {
         _heroLevel = param1;
         return this;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(this.heroInfo)
         {
            _loc5_ = this.heroInfo;
            _loc4_ = StcMgr.ins.getNpcVo(_loc5_.baseInfo.baseId);
            _loc2_ = _name != null?_name:HeroInfoUtil.getNameHasTupoLevel(_loc5_.baseInfo.baseId,isShowTitleName);
            if(Uint64Util.equal(HeroModel.ins.playerHero.baseInfo.id,_loc5_.baseInfo.id))
            {
               _loc2_ = LabelMed.vipParam(PlayerModel.ins.vipInfoVo) + _loc2_;
            }
            else if(OtherRoleInfoModel.ins.playerHero && Uint64Util.equal(OtherRoleInfoModel.ins.playerHero.baseInfo.id,_loc5_.baseInfo.id))
            {
               _loc2_ = LabelMed.vipParam(VipUtils.qqInfoToVipInfoVo(OtherRoleInfoModel.ins.qqInfo)) + _loc2_;
            }
            this.txt_name.y = 10;
            if(!ClientConfig.isChineseLang())
            {
               if(!Uint64Util.equal(HeroModel.ins.playerHero.baseInfo.id,_loc5_.baseInfo.id))
               {
                  _loc2_ = _name != null?_name:HeroInfoUtil.getHtmlNameHasTupoLevel(_loc5_.baseInfo.baseId,true,false);
               }
               if(!HeroInfoUtil.isPlayerHeroByBaseId(_loc5_.baseInfo.baseId))
               {
                  _loc3_ = HeroInfoUtil.getHtmlNameHasTupoLevel(_loc5_.baseInfo.baseId,false,isShowTitleName);
                  if(_loc3_ != "")
                  {
                     _loc2_ = _loc2_ + "\n" + _loc3_;
                     this.txt_name.y = 0;
                  }
               }
            }
            this.txt_name.text = _loc2_;
            if(HeroModel.ins.isCurPlayerHeroByStcNpcId(_loc5_.baseInfo.baseId))
            {
               this.txt_level.text = _loc5_.baseInfo.level.toString() + "/" + DefindConsts.HERO_LV_LIMIT;
            }
            else if(_playerLevel == 0)
            {
               this.txt_level.text = _loc5_.baseInfo.level.toString() + "/" + HeroModel.ins.playerHero.baseInfo.level;
            }
            else
            {
               this.txt_level.text = _loc5_.baseInfo.level.toString() + "/" + _playerLevel;
            }
            if(!HeroModel.ins.isCurPlayerHeroByStcNpcId(heroInfo.baseInfo.baseId))
            {
               this.img_carrer.skin = UrlLib.npcTypeImg(_loc4_.career_id);
               this.img_group.skin = UrlLib.npcGroupImg(_loc4_.group);
               this.img_carrer.visible = true;
               this.img_group.visible = true;
            }
            else
            {
               this.img_carrer.visible = false;
               this.img_group.visible = false;
            }
         }
         if(this.stcNpcVo)
         {
            _loc4_ = this.stcNpcVo;
            this.txt_name.text = HeroInfoUtil.getNameHasTupoLevel(this.stcNpcVo.id,isShowTitleName);
            this.box_level.visible = false;
            if(!HeroModel.ins.isCurPlayerHeroByStcNpcId(stcNpcVo.id))
            {
               this.img_carrer.skin = UrlLib.npcTypeImg(_loc4_.career_id);
               this.img_group.skin = UrlLib.npcGroupImg(_loc4_.group);
               this.img_carrer.visible = true;
               this.img_group.visible = true;
            }
            else
            {
               this.img_carrer.visible = false;
               this.img_group.visible = false;
            }
            if(HeroModel.ins.isCurPlayerHeroByStcNpcId(this.stcNpcVo.id))
            {
               this.txt_level.text = _heroLevel + "/" + DefindConsts.HERO_LV_LIMIT;
            }
            else if(_playerLevel == 0)
            {
               this.txt_level.text = _heroLevel + "/" + HeroModel.ins.playerHero.baseInfo.level;
            }
            else
            {
               this.txt_level.text = _heroLevel + "/" + _playerLevel;
            }
         }
         if(_showLevel)
         {
            this.box_level.visible = true;
         }
         else
         {
            this.box_level.visible = false;
         }
         this.txt_name.color = ColorLib.qualityColor(_loc4_.quality);
         this.img_carrer.toolTip = new ToolTipNpcCarrerVo(_loc4_.career_id);
         this.img_group.toolTip = new ToolTipNpcGroupVo(_loc4_.group);
         if(HeroModel.ins.isCurPlayerHeroByStcNpcId(_loc4_.id))
         {
            if(_military >= 0)
            {
               this.txt_name.color = ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(_military));
               _military = -1;
            }
            else
            {
               this.txt_name.color = ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank));
            }
         }
         _name = null;
      }
   }
}
