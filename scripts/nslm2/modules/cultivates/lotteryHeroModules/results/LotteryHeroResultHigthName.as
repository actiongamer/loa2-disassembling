package nslm2.modules.cultivates.lotteryHeroModules.results
{
   import game.ui.lotteryHeroModules.results.LotteryHeroResultHigthNameUI;
   import nslm2.common.ui.components.comps2d.ClickToNextButtonTime;
   import morn.customs.components.PlayerTitleRender;
   import nslm2.modules.globalModules.facebook.view.FBBtnView;
   import proto.HeroInfo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.utils.PlatformUtil;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import com.mz.core.configs.EnvConfig;
   
   public class LotteryHeroResultHigthName extends LotteryHeroResultHigthNameUI
   {
       
      
      public function LotteryHeroResultHigthName()
      {
         super();
         clickToNextUI.visible = false;
         clickToNextButtonTimeUI.visible = true;
      }
      
      public function get clickToNextButtonTime() : ClickToNextButtonTime
      {
         return this.clickToNextButtonTimeUI as ClickToNextButtonTime;
      }
      
      private function get playerTitleRender() : PlayerTitleRender
      {
         return this.box_heroName as PlayerTitleRender;
      }
      
      private function get fbBtnView() : FBBtnView
      {
         return this.faceBookView as FBBtnView;
      }
      
      public function show(param1:HeroInfo, param2:Boolean = true) : void
      {
         if(param2)
         {
            ModuleMgr.ins.staticLayer.switchVisible("LotteryHeroResult",false,[11900]);
         }
         var _loc4_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseInfo.baseId);
         var _loc3_:uint = ColorLib.qualityColor(_loc4_.quality);
         this.playerTitleRender.showLevel(false).heroInfo = param1;
         this.txt_des.text = LocaleMgr.ins.getStr(_loc4_.description1);
         this.list_skill.array = _loc4_.skillIdArr;
         this.txt_heroQuality.text = LocaleMgr.ins.getStr(999000069) + TextFieldUtil.htmlText(LocaleMgr.ins.getStr(6000 + _loc4_.quality),new TextFormat(null,null,_loc3_)) + LocaleMgr.ins.getStr(999000070);
         if(param2)
         {
            TweenLite.to(this,0.3,{
               "alpha":1,
               "visible":true,
               "onComplete":showCpl
            });
         }
         else
         {
            this.alpha = 1;
            this.visible = true;
            NGUtil.checkModuleShow(11903,this);
         }
         checkFaceBook(param1,_loc4_);
      }
      
      private function checkFaceBook(param1:HeroInfo, param2:StcNpcVo) : void
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         fbBtnView.visible = false;
         if(PlatformUtil.isFeedShowFaceBook)
         {
            _loc3_ = StcMgr.ins.getVoArrByColumnValue("static_facebook_feed","feedType",2);
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc5_ = _loc3_[_loc4_] as StcFacebookFeedVo;
               if(_loc5_ && param1.baseInfo.level < int(_loc5_.para_1))
               {
                  if(uint(_loc5_.para_2) == 4)
                  {
                     fbBtnView.visible = true;
                     fbBtnView.dataSource = {
                        "feedId":_loc5_.ID,
                        "para_1":playerTitleRender.txt_name.text,
                        "para_2":0
                     };
                     break;
                  }
                  if(uint(_loc5_.para_2) == 5)
                  {
                     fbBtnView.visible = true;
                     fbBtnView.dataSource = {
                        "feedId":_loc5_.ID,
                        "para_1":playerTitleRender.txt_name.text,
                        "para_2":0
                     };
                     break;
                  }
               }
               _loc4_++;
            }
         }
      }
      
      private function showCpl() : void
      {
         NGUtil.checkModuleShow(11903,this);
         if(EnvConfig.ins.ptId != 2306)
         {
            clickToNextButtonTime.show();
         }
      }
      
      public function hide() : void
      {
         clickToNextButtonTime.hide();
         ModuleMgr.ins.staticLayer.switchVisible("LotteryHeroResult",true,[11900]);
         this.visible = false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
