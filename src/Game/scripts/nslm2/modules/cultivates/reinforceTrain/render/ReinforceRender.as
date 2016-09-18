package nslm2.modules.cultivates.reinforceTrain.render
{
   import game.ui.reinforceTrain.ReinforceRenderUI;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.events.MouseEvent;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import proto.HeroInfo;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.cultivates.reinforceTrain.view.ReinforceLevView;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.TextFieldUtil;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import flash.display.Sprite;
   import nslm2.common.ctrls.ProgressBarCtrl;
   
   public class ReinforceRender extends ReinforceRenderUI
   {
       
      
      private var filterMed:RoleGrowFilterMed;
      
      private var i:uint;
      
      private var requstList:Array;
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var addEff:BmcSpriteSheet;
      
      public function ReinforceRender()
      {
         requstList = [];
         super();
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(0,1);
         _loc1_.graphics.drawRect(0,0,img_bord.width,img_bord.height);
         _loc1_.x = img_bord.x;
         _loc1_.y = img_bord.y;
         _loc1_.graphics.endFill();
         filterMed = new RoleGrowFilterMed(this,null);
         this.parts.push(new RoleGrowFilterMed(this,null));
         this.parts.push(new ProgressBarCtrl(this.progress_lev));
         this.img_head.mask = _loc1_;
         this.addChild(_loc1_);
         this.txt_hint.text = LocaleMgr.ins.getStr(30815011);
         img_plus.visible = false;
         tipTxt.text = LocaleMgr.ins.getStr(30815018);
      }
      
      override public function dispose() : void
      {
         this.img_bord.toolTip = null;
         super.dispose();
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEventListener("click",onMouseClick);
         }
         else
         {
            this.removeEventListener("click",onMouseClick);
         }
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         requstList = [];
         var _loc4_:int = 0;
         var _loc3_:* = HeroModel.ins.YuanJunArr;
         for each(var _loc2_ in HeroModel.ins.YuanJunArr)
         {
            if(_loc2_.heroData)
            {
               if(!HeroModel.ins.getHeroInfoQuick(_loc2_.heroData.id))
               {
                  requstList.push(_loc2_.heroData.id);
               }
            }
         }
         if(requstList.length > 0)
         {
            i = 0;
            HeroModel.ins.getHeroInfo(requstList[i],i == requstList.length?openModuleHandler:haha);
         }
         else
         {
            openModuleHandler(HeroModel.ins.getHeroInfoQuick(vo.heroData.id));
         }
      }
      
      private function haha(param1:HeroInfo) : void
      {
         i = Number(i) + 1;
         HeroModel.ins.getHeroInfo(requstList[i],i + 1 == requstList.length?openModuleHandler:haha);
      }
      
      private function openModuleHandler(param1:HeroInfo) : void
      {
         var _loc2_:RoleInfoModuleParam = new RoleInfoModuleParam();
         _loc2_.init(param1,20010,false,true);
         ModuleMgr.ins.showModule(30100,_loc2_,30815);
      }
      
      public function get vo() : YuanJunVo
      {
         return this.dataSource as YuanJunVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(vo == null)
         {
            return;
         }
         if(ClientConfig.isRuLang())
         {
            this.tipTxt.width = 70;
            this.tipTxt.x = 0;
         }
         if(vo.heroData)
         {
            this.progress_lev.visible = true;
            this.txt_name.visible = true;
            this.txt_lev.visible = true;
            this.img_label.visible = true;
            _loc4_ = StcMgr.ins.getNpcVo(vo.heroData.baseId);
            this.img_head.url = UrlLib.npcDialogIcon(_loc4_.head_id);
            this.txt_name.text = HeroInfoUtil.getHtmlNameHasTupoLevel(vo.heroData.baseId);
            this.img_bord.toolTip = vo.heroData;
            _loc2_ = _loc4_.quality;
            this.txt_hint.visible = true;
            this.img_bord.url = "png.uiReinforceTrain.img_b" + (_loc2_ - 1);
            _loc3_ = DisplayUtils.findParentMatchingClass(this,ReinforceLevView);
            this.progress_lev.value = vo.heroData.level / (!!_loc3_.nextVo?_loc3_.nextVo.condition_1:int(_loc3_.curVo.condition_1));
            this.txt_openLvl.visible = false;
            this.img_plus.visible = false;
            this.img_head.visible = true;
            this.img_lock.visible = false;
            this.txt_lev.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(30815014),[vo.heroData.level,!!_loc3_.nextVo?_loc3_.nextVo.condition_1:int(_loc3_.curVo.condition_1)]);
            if(addEff)
            {
               addEff.dispose();
               addEff = null;
            }
         }
         else
         {
            this.img_bord.url = "png.uiReinforceTrain.img_b1";
            this.progress_lev.visible = false;
            this.txt_name.visible = false;
            this.txt_lev.visible = false;
            this.img_label.visible = false;
            this.img_head.visible = false;
            this.txt_hint.visible = false;
            if(PlayerModel.ins.level >= vo.openLvl && vo.isOpen)
            {
               img_lock.visible = false;
               txt_openLvl.visible = false;
               if(!addEff)
               {
                  addEff = new BmcSpriteSheet();
                  addEff.init(10000005,1,"all",true);
                  addEff.x = 50;
                  addEff.y = 55;
                  this.addChild(addEff);
               }
               this.txt_openLvl.visible = false;
            }
            else
            {
               img_lock.visible = false;
               txt_openLvl.visible = true;
               if(addEff)
               {
                  addEff.dispose();
                  addEff = null;
               }
               txt_openLvl.text = TextFieldUtil.htmlText2(vo.openLvl,458496) + LocaleMgr.ins.getStr(30815015);
            }
         }
         filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_loc2_));
      }
   }
}
