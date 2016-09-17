package nslm2.modules.cultivates.lotteryHeroModules.getRewards
{
   import game.ui.lotteryHeroModules.getRewards.GetRewardRenderUI;
   import nslm2.common.uiEffects.RollTweenSelectBoxMed;
   import flash.events.MouseEvent;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.MouseIconManager;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Image;
   
   public class GetRewardRender extends GetRewardRenderUI
   {
       
      
      private var rollMed:RollTweenSelectBoxMed;
      
      public function GetRewardRender()
      {
         super();
         rollMed = new RollTweenSelectBoxMed(this,this.img_selectBox);
         this.parts.push(new RollTweenSelectBoxMed(this,this.img_selectBox));
         txt_name.underline = true;
         txt_name.buttonMode = true;
         txt_name.addEventListener("click",txt_nameHandler);
         txt_name.addEventListener("rollOver",txt_nameHandler);
         txt_name.addEventListener("rollOut",txt_nameHandler);
      }
      
      private function txt_nameHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.type;
         if("click" !== _loc3_)
         {
            if("rollOver" !== _loc3_)
            {
               if("rollOut" === _loc3_)
               {
                  MouseIconManager.changeMouseCursor("auto");
                  this.buttonMode = false;
               }
            }
            else
            {
               MouseIconManager.changeMouseCursor("hand");
               this.buttonMode = true;
            }
         }
         else if(wealthVo.kind == 30)
         {
            _loc2_ = new RoleInfoModuleParam();
            _loc2_.init(HeroInfoUtil.createFakeHeroInfoByNpcVo(this.wealthVo.stcNpcVo),30100,true);
            ModuleMgr.ins.showModule(30100,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      public function set canGet(param1:Boolean) : void
      {
         if(param1 == false)
         {
            this.btn_select.selected = false;
         }
         this.btn_select.disabled = !param1;
         this.btn_select.mouseEnabled = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc7_:int = 0;
         var _loc5_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc8_:int = 0;
         .super.dataSource = param1;
         if(wealthVoIsEnable)
         {
            this.img_using.visible = false;
            this.txt_tupoNeed.visible = false;
            if(wealthVo.kind == 30)
            {
               DisplayUtils.addChildFromGlobal(this.parent,txt_name);
               _loc7_ = this.wealthVo.sid;
               _loc5_ = HeroModel.ins.teamHeroArr.length;
               _loc9_ = 0;
               while(_loc9_ < _loc5_)
               {
                  _loc4_ = HeroModel.ins.teamHeroArr[_loc9_];
                  if(_loc4_ && _loc4_.heroData)
                  {
                     _loc6_ = StcMgr.ins.getNpcVo(_loc7_);
                     _loc2_ = StcMgr.ins.getNpcVo(_loc4_.heroData.baseId);
                     if(_loc6_.node == _loc2_.node)
                     {
                        this.img_using.visible = true;
                        _loc3_ = StcMgr.ins.getTupoVo(_loc6_.tupo);
                        _loc8_ = 0;
                        if(_loc3_)
                        {
                           if(StringUtils.isNull(_loc3_.cost_hero) == false)
                           {
                              _loc8_ = WealthUtil.parseCostStr(_loc3_.cost_hero).count;
                           }
                        }
                        if(_loc8_ > 0)
                        {
                           this.txt_tupoNeed.visible = true;
                           this.txt_tupoNeed.text = LocaleMgr.ins.getStr(11900050,[_loc8_]);
                        }
                     }
                  }
                  _loc9_++;
               }
               this.img_group.skin = UrlLib.npcGroupImg(this.wealthVo.stcNpcVo.group);
               this.txt_group.text = !!HeroModel.ins.isCurPlayerHeroByStcNpcId(this.wealthVo.stcNpcVo.id)?"":LocaleMgr.ins.getStr(5100 + this.wealthVo.stcNpcVo.group);
               this.ref_txt_num.visible = false;
            }
            else if(wealthVo.kind == 20)
            {
               this.ref_txt_num.visible = true;
            }
            this.visible = true;
         }
         else
         {
            this.visible = false;
         }
      }
      
      override protected function showPieceTip(param1:String = null, param2:int = 26, param3:int = 26) : void
      {
         if(icon_pieceTip == null)
         {
            if(param1 == null)
            {
               param1 = UrlLib.piece_tip();
            }
            icon_pieceTip = new Image(param1);
            icon_pieceTip.width = param2;
            icon_pieceTip.height = param3;
            icon_pieceTip.scaleX = ref_img_icon.scaleX <= 0.7?ref_img_icon.scaleX + 0.3:Number(ref_img_icon.scaleX);
            icon_pieceTip.scaleY = ref_img_icon.scaleY <= 0.7?ref_img_icon.scaleY + 0.3:Number(ref_img_icon.scaleY);
            icon_pieceTip.anchorX = ref_img_icon.anchorX;
            icon_pieceTip.anchorY = ref_img_icon.anchorY;
            icon_pieceTip.x = (ref_img_icon.x + ref_img_icon.width - param2 + 2) * ref_img_icon.scaleX;
            icon_pieceTip.y = (ref_img_icon.y - 2) * ref_img_icon.scaleY;
            icon_pieceTip.smoothing = true;
            this.box_bg.addChild(icon_pieceTip);
         }
         if(icon_pieceTip.skin != param1)
         {
            icon_pieceTip.skin == param1;
            icon_pieceTip.width = param2;
            icon_pieceTip.height = param3;
         }
         icon_pieceTip.visible = true;
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         if(btn_select.disabled == false)
         {
            if(param1 == 3)
            {
               this.btn_select.selected = true;
               this.img_selectBox.alpha = 1;
               this.rollMed.actived = false;
            }
            else
            {
               this.btn_select.selected = false;
               this.img_selectBox.alpha = 0;
               this.rollMed.actived = true;
            }
         }
      }
      
      override public function dispose() : void
      {
         txt_name.removeEventListener("click",txt_nameHandler);
         txt_name.removeEventListener("rollOver",txt_nameHandler);
         txt_name.removeEventListener("rollOut",txt_nameHandler);
         DisplayUtils.removeSelf(txt_name);
         super.dispose();
      }
   }
}
