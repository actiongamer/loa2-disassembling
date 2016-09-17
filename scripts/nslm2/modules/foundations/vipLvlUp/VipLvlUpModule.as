package nslm2.modules.foundations.vipLvlUp
{
   import game.ui.vipLvlUpModule.VipLvlUpModuleUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.vos.StcVipVo;
   import morn.core.components.Label;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.MouseEvent;
   
   public class VipLvlUpModule extends VipLvlUpModuleUI
   {
       
      
      private var curVip:int;
      
      private const GIFT_X:int = 364;
      
      private const GIFT_Y:int = 187;
      
      private var eff_forword:BmcSpriteSheet;
      
      private var eff_vip:BmcSpriteSheet;
      
      public function VipLvlUpModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc6_:* = null;
         var _loc11_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         GlobalRef.needShowVip = false;
         this.moduleFadeInType = 2;
         this.img_person.skin = UrlLib.getVipLvlUpImg("img_person");
         this.img_bg.skin = UrlLib.getVipLvlUpImg("img_bg");
         this.img_congraduate.skin = UrlLib.getVipLvlUpImg("img_congraduate");
         this.img_light1.skin = UrlLib.getVipLvlUpImg("img_light");
         this.img_light2.skin = UrlLib.getVipLvlUpImg("img_light");
         this.img_enhance.skin = UrlLib.getVipLvlUpImg("img_enhance");
         this.img_gift.skin = UrlLib.getVipLvlUpImg("img_gift");
         this.img_vip1.skin = UrlLib.getVipLvlUpImg("img_vip");
         this.img_vip2.skin = UrlLib.getVipLvlUpImg("img_vip");
         this.img_vipbig.skin = UrlLib.getVipLvlUpImg("img_vipbig");
         var _loc8_:Array = StcMgr.ins.getVipTable().array;
         var _loc10_:Array = [];
         var _loc9_:Array = [];
         curVip = PlayerModel.ins.vip;
         if(curVip == 0)
         {
            AlertUtil.float("VIP为0时不应该弹出此界面");
            this.preShowCpl();
            return;
         }
         eff_vip = new BmcSpriteSheet();
         eff_vip.x = 140;
         eff_vip.y = 0;
         eff_vip.init(10800005,1,"all",false,1,0);
         this.addChild(eff_vip);
         this.txt_vip1.value = curVip;
         this.txt_vip2.value = curVip;
         this.txt_vip3.value = curVip;
         this.label_include.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000383),[curVip]);
         var _loc7_:Array = DefindConsts["VIP_SHOW_LV" + curVip].split("|");
         var _loc13_:int = 0;
         var _loc12_:* = _loc7_;
         for each(var _loc2_ in _loc7_)
         {
            _loc6_ = StcMgr.ins.getVipVo(_loc2_);
            if(isOverZero(_loc6_))
            {
               _loc9_.push(_loc6_);
            }
            else
            {
               _loc10_.push(_loc6_);
            }
         }
         _loc11_ = 0;
         while(_loc11_ < 5)
         {
            _loc5_ = this["label_enhance" + (_loc11_ + 1)] as Label;
            if(ClientConfig.isRuLang())
            {
               _loc5_.width = 240;
               _loc5_.height = 50;
               _loc5_.multiline = true;
               _loc5_.wordWrap = true;
            }
            if(_loc11_ < _loc9_.length)
            {
               _loc5_.text = setEnhanceText(_loc9_[_loc11_]) + " <font color=\'#fff300\'>" + LocaleMgr.ins.getStr(999001130) + "</font>";
            }
            else
            {
               _loc5_.text = setEnhanceText(_loc10_[_loc11_ - _loc9_.length]);
            }
            _loc11_++;
         }
         var _loc3_:Array = VipModel.ins.getVipGiftItemArr();
         _loc11_ = 0;
         while(_loc11_ < _loc3_.length)
         {
            _loc4_ = new Label();
            _loc4_.x = 364;
            _loc4_.y = 187 + 24 * _loc11_;
            if(ClientConfig.isRuLang())
            {
               _loc4_.width = 220;
               _loc4_.wordWrap = true;
               _loc4_.multiline = true;
               _loc4_.leading = -4;
               _loc4_.y = 187 + 30 * _loc11_;
            }
            if((_loc3_[_loc11_] as WealthVo).stcNpcVo)
            {
               _loc4_.text = LocaleMgr.ins.getStr(30100351,[_loc3_[_loc11_].stcNpcVo.id,LocaleConsts.getNumberAbbr2(_loc3_[_loc11_].showCount)]);
            }
            else if((_loc3_[_loc11_] as WealthVo).stcItemVo)
            {
               _loc4_.text = setItemText(_loc3_[_loc11_] as WealthVo);
            }
            else if((_loc3_[_loc11_] as WealthVo).kind == 2)
            {
               _loc4_.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000384),[LocaleConsts.getNumberAbbr2(_loc3_[_loc11_].showCount)]);
            }
            else if((_loc3_[_loc11_] as WealthVo).kind == 1)
            {
               _loc4_.text = LocaleMgr.ins.parseParamAdvance(LocaleMgr.ins.getStr(999000385),[LocaleConsts.getNumberAbbr2(_loc3_[_loc11_].showCount)]);
            }
            _loc4_.style = "普通说明";
            addChild(_loc4_);
            _loc11_++;
         }
         eff_forword = new BmcSpriteSheet();
         eff_forword.x = 390;
         eff_forword.y = 356;
         eff_forword.init(10800002,1,"all",true,1,0);
         eff_forword.mouseChildren = true;
         eff_forword.mouseEnabled = true;
         eff_forword.buttonMode = true;
         addChild(eff_forword);
         label_giftlast.y = 187 + 24 * _loc3_.length;
         if(ClientConfig.isRuLang())
         {
            label_giftlast.y = 187 + 30 * _loc3_.length;
         }
         this.preShowCpl();
      }
      
      private function stage_click(param1:Event) : void
      {
         UIMgr.stage.removeEventListener("click",stage_click);
         ModuleMgr.ins.closeModule(this.moduleId);
         ModuleMgr.ins.showModule(10800,null);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
         UIMgr.stage.removeEventListener("click",stage_click);
      }
      
      protected function effClickHandler1(param1:MouseEvent) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
         ModuleMgr.ins.showModule(10800,null);
      }
      
      private function setItemText(param1:WealthVo) : String
      {
         var _loc2_:* = param1.stcItemVo.kind;
         if(2 !== _loc2_)
         {
            if(4 !== _loc2_)
            {
               if(3 !== _loc2_)
               {
                  if(1 !== _loc2_)
                  {
                     if(8 !== _loc2_)
                     {
                        if(9 !== _loc2_)
                        {
                           if(26 !== _loc2_)
                           {
                              if(27 !== _loc2_)
                              {
                                 if(31 !== _loc2_)
                                 {
                                    if(97 !== _loc2_)
                                    {
                                       return null;
                                    }
                                    return LocaleMgr.ins.getStr(30100356,[param1.stcItemVo.id,param1.showCount]);
                                 }
                                 return LocaleMgr.ins.getStr(30100358,[param1.stcItemVo.id,param1.showCount]);
                              }
                              return LocaleMgr.ins.getStr(30100357,[param1.stcItemVo.id,param1.showCount]);
                           }
                           return LocaleMgr.ins.getStr(30100352,[param1.stcItemVo.id,param1.showCount]);
                        }
                     }
                     return LocaleMgr.ins.getStr(30100359,[param1.stcItemVo.id,param1.showCount]);
                  }
               }
               addr10:
               return LocaleMgr.ins.getStr(30100355,[param1.stcItemVo.id,param1.showCount]);
            }
            addr9:
            §§goto(addr10);
         }
         §§goto(addr9);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         UIMgr.stage.addEventListener("click",stage_click);
      }
      
      private function setEnhanceText(param1:StcVipVo) : String
      {
         if(param1.id % 11000 < 1000)
         {
            return LocaleMgr.ins.getStr(param1.name);
         }
         var _loc2_:* = param1.id;
         if(10060 !== _loc2_)
         {
            if(10420 !== _loc2_)
            {
               if(10520 !== _loc2_)
               {
                  return LocaleMgr.ins.getStr(param1.name) + ":<font color=\'#06ff00\'>" + Number(param1["vip_" + curVip]) + "</font>";
               }
            }
            return LocaleMgr.ins.getStr(param1.name) + ":<font color=\'#06ff00\'>" + Number(param1["vip_" + curVip]) + "%</font>";
         }
         return LocaleMgr.ins.getStr(param1.name) + ":<font color=\'#06ff00\'>" + param1["vip_" + curVip] * 100 + "%</font>";
      }
      
      private function isEnhanced(param1:StcVipVo) : Boolean
      {
         if(curVip == 0)
         {
            return false;
         }
         if(int(param1["vip_" + curVip]) - int(param1["vip_" + (curVip - 1)]) > 0)
         {
            return true;
         }
         return false;
      }
      
      private function isFirstEnhanced(param1:StcVipVo) : Boolean
      {
         var _loc2_:int = curVip;
         if(_loc2_ < 2)
         {
            return true;
         }
         while(param1["vip_" + (_loc2_ - 1)] - param1["vip_" + (_loc2_ - 2)] == 0)
         {
            if(_loc2_ == 2)
            {
               return true;
            }
            _loc2_--;
         }
         return false;
      }
      
      private function isOverZero(param1:StcVipVo) : Boolean
      {
         if(curVip == 0)
         {
            return false;
         }
         if(int(param1["vip_" + curVip]) - int(param1["vip_" + (curVip - 1)]) > 0 && int(param1["vip_" + (curVip - 1)]) == 0)
         {
            return true;
         }
         return false;
      }
   }
}
