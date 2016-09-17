package nslm2.modules.foundations.heroChoose
{
   import game.ui.heroChooseModules.HeroChooseModuleUI;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class HeroChooseModule extends HeroChooseModuleUI
   {
       
      
      private var _initVo:nslm2.modules.foundations.heroChoose.HeroChooseInitVo;
      
      public function HeroChooseModule()
      {
         super();
      }
      
      private function get pageBarRef() : IPageBar
      {
         return pageBar as IPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         initLanguage();
         HeroChooseModel.ins.choosedNpcId = 0;
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         if(param1)
         {
            _initVo = param1 as nslm2.modules.foundations.heroChoose.HeroChooseInitVo;
         }
         else
         {
            _initVo = new nslm2.modules.foundations.heroChoose.HeroChooseInitVo();
            _initVo.initByAllNpcId();
         }
         this.txt_alert.text = _initVo.alert;
         this.list_groups.dataSource = [new HeroGroupVo(1,_initVo.fengbaoArr),new HeroGroupVo(2,_initVo.shenshengArr),new HeroGroupVo(3,_initVo.zhenbaoArr)];
         toStateChooseGroup();
         this.panelBg.titleImgId = this.moduleId;
         this.pageBarRef.bindList(this.list_heros);
         super.preShow(param1);
      }
      
      private function initLanguage() : void
      {
         this.btn_back.label = LocaleMgr.ins.getStr(9094400);
         this.btn_confirm.label = LocaleMgr.ins.getStr(9010100);
      }
      
      private function toStateChooseGroup() : void
      {
         this.list_groups.visible = true;
         this.box_hero.visible = false;
         this.txt_alert.text = this._initVo.alert;
      }
      
      private function toStateChooseHero(param1:int) : void
      {
         this.list_groups.visible = false;
         this.box_hero.visible = true;
         this.txt_alert.text = LocaleMgr.ins.getStr(109001011);
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_back !== _loc2_)
         {
            if(this.btn_confirm === _loc2_)
            {
               if(HeroChooseModel.ins.choosedNpcId == 0)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(109001012));
               }
               else
               {
                  ObserverMgr.ins.sendNotice("heroChooseConfirmed",HeroChooseModel.ins.choosedNpcId);
                  HeroChooseModel.ins.choosedNpcId = 0;
                  ModuleMgr.ins.closeModule(this.moduleId);
               }
            }
         }
         else
         {
            toStateChooseGroup();
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("chooseHero");
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("chooseHero" === _loc4_)
         {
            _loc3_ = param2 as HeroGroupVo;
            this.list_heros.dataSource = _loc3_.heroArr;
            toStateChooseHero(_loc3_.group);
         }
      }
   }
}
