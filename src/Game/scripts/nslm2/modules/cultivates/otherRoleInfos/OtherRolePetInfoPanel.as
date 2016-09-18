package nslm2.modules.cultivates.otherRoleInfos
{
   import game.ui.otherRoleInfos.panel.OtherRolePetInfoPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.PetInfo;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.WealthUtil;
   
   public class OtherRolePetInfoPanel extends OtherRolePetInfoPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var LIST_STAR_CENTER_X:int = 324;
      
      public function OtherRolePetInfoPanel()
      {
         super();
         this.x = -47;
         this.y = -20;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.refresh();
         ObserverMgr.ins.regObserver(this);
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
      
      public function getFocusNotices() : Array
      {
         return null;
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
      }
      
      private function refresh() : void
      {
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc9_:PetInfo = OtherRoleInfoModel.ins.pet;
         var _loc1_:PetInfoVo = new PetInfoVo(OtherRoleInfoModel.ins.pet.id);
         _loc1_.petInfo = OtherRoleInfoModel.ins.pet;
         var _loc8_:int = 1;
         var _loc3_:Array = [null,null,null,null,null,null];
         if(_loc9_)
         {
            if(_loc9_.star > 0)
            {
               _loc2_ = PetModel.getStarLightArray(_loc9_.star,true);
               _loc5_ = _loc2_.length;
               list_stars.dataSource = _loc2_;
               list_stars.repeatX = Math.min(10,_loc5_);
               if(_loc9_.star <= 10)
               {
                  list_stars_2.visible = false;
               }
               else
               {
                  list_stars_2.visible = true;
                  list_stars_2.dataSource = _loc2_;
                  list_stars_2.repeatX = _loc5_ - 10;
               }
               list_stars_2.x = LIST_STAR_CENTER_X + (-list_stars_2.width >> 1);
               list_stars.x = LIST_STAR_CENTER_X + (-list_stars.width >> 1);
            }
            else
            {
               list_stars_2.dataSource = [];
               list_stars.dataSource = [];
            }
            _loc8_ = _loc9_.grade;
            _loc7_ = Uint64Util.toInt(_loc9_.ability);
            _loc3_ = PetUtil.getPosBuffArr(_loc9_.id,_loc9_.star);
            list_baseProp.dataSource = HeroInfoUtil.toBasePropList(_loc9_.prop);
            _loc4_ = PetUtil.getPetAllAttrByInfo(_loc9_);
            if(_loc4_.length == 0)
            {
               list_allProp.dataSource = PetUtil.getPetAllAttr(_loc1_.stcVo.id,1,0);
               this.txt_grolyTitle.text = LocaleMgr.ins.getStr(32000011) + TextFieldUtil.htmlText2("(" + LocaleMgr.ins.getStr(320000201) + ")",16723968);
            }
            else
            {
               list_allProp.dataSource = _loc4_;
               this.txt_grolyTitle.text = LocaleMgr.ins.getStr(32000011);
            }
         }
         else
         {
            list_stars.dataSource = [];
            if(_loc1_)
            {
               _loc6_ = StcMgr.ins.getVoArrByColumnValue("static_pet_star","node",_loc1_.stcVo.node).length;
               list_baseProp.dataSource = _loc1_.basePropArr;
               list_allProp.dataSource = PetUtil.getPetAllAttr(_loc1_.stcVo.id,_loc6_ - 1,0);
               _loc7_ = _loc1_.stcVo.combat_power;
               _loc3_ = _loc1_.posBuffArr;
            }
            this.txt_grolyTitle.text = LocaleMgr.ins.getStr(32000011) + TextFieldUtil.htmlText2("(" + LocaleMgr.ins.getStr(320000200) + ")",458496);
         }
         list_skill.dataSource = PetUtil.getPetAllSkillVoArr(_loc9_.id,_loc8_);
         fightValueBoxRef.txt_fightValue.tweenValue = _loc7_;
         txt_legend.text = LocaleMgr.ins.getStr(_loc1_.stcVo.description1);
         txt_legend.height = txt_legend.textHeight + 20;
         updateInfoPos();
         infoPanel.scrollTo();
         updatePetInfo(_loc9_);
      }
      
      private function updateInfoPos() : void
      {
         box_down1.height = 28 + 20 * (!!list_allProp.dataSource?list_allProp.dataSource.length:0);
      }
      
      private function updatePetInfo(param1:PetInfo) : void
      {
         var _loc2_:int = 1;
         var _loc3_:int = 0;
         if(param1)
         {
            _loc2_ = param1.level;
            _loc3_ = param1.grade;
         }
         txt_level.text = LocaleConsts.lvStr(_loc2_);
         txt_jinjie.text = LocaleMgr.ins.getStr(32000008,[_loc3_]);
         txt_name.text = WealthUtil.getNpcName(param1.id);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         ObserverMgr.ins.unregObserver(this);
      }
   }
}
