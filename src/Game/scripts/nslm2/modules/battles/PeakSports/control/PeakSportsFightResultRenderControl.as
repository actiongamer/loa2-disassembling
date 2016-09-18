package nslm2.modules.battles.PeakSports.control
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.View;
   import proto.BkFightInfo;
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import morn.core.components.List;
   import nslm2.modules.battles.PeakSports.model.vos.FastPeakSportsData;
   import game.ui.commons.icons.BuffRenderS1UI;
   import nslm2.common.vo.BuffHasLayersVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.common.vo.PlayerVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.interFace.IFightValueBox;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import com.greensock.TweenLite;
   import nslm2.modules.battles.PeakSports.model.vos.PeakSportsFightHeroVo;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.foundations.alerts.views.SimpleStrMsg;
   import proto.BattlePlayer;
   import nslm2.modules.battles.battle.FPUtil;
   
   public class PeakSportsFightResultRenderControl implements IDispose
   {
      
      public static const IMG_HEAD_RENDER:String = "headRender";
      
      public static const IMG_HEAD:String = "img_head";
      
      public static const TXT_NAME:String = "txt_name";
      
      public static const FIGHT_VALUE:String = "fight_value";
      
      public static const PROGRESSBAR_HP:String = "progressBar_hp";
      
      public static const TXT_PROGRESS_VALUE:String = "txt_progressValue";
      
      public static const IMG_FIGHT_VALUE_BG:String = "img_fightValueBg";
      
      public static const TXT_LEVEL:String = "txt_level";
      
      public static const LIST_HEROES:String = "list_heroes";
      
      public static const IMG_BG:String = "img_bg";
      
      public static const BUFF_ICON:String = "buff_icon";
       
      
      public var render:View;
      
      public var bgFightInfo:BkFightInfo;
      
      private var _initPlayers:Array;
      
      private var _resultPlayers:Array;
      
      public var isLeft:Boolean;
      
      public var playerData:FastPeakSportsData;
      
      public function PeakSportsFightResultRenderControl()
      {
         _initPlayers = [];
         _resultPlayers = [];
         super();
      }
      
      public function getRef(param1:String) : *
      {
         if(render.hasOwnProperty(param1))
         {
            return render[param1];
         }
         return null;
      }
      
      public function get ref_img_head_render() : PlayerRender
      {
         return getRef("headRender");
      }
      
      public function get ref_img_head() : Image
      {
         return getRef("img_head");
      }
      
      public function get ref_txt_name() : Label
      {
         return getRef("txt_name");
      }
      
      public function get ref_fight_value() : View
      {
         return getRef("fight_value");
      }
      
      public function get ref_progressBar_hp() : ProgressBar
      {
         return getRef("progressBar_hp");
      }
      
      public function get ref_txt_progress_value() : Label
      {
         return getRef("txt_progressValue");
      }
      
      public function get ref_img_fight_value_bg() : Image
      {
         return getRef("img_fightValueBg");
      }
      
      public function get ref_txt_level() : Label
      {
         return getRef("txt_level");
      }
      
      public function get ref_list_heroes() : List
      {
         return getRef("list_heroes");
      }
      
      public function get ref_img_bg() : Image
      {
         return getRef("img_bg");
      }
      
      public function get ref_buff_icon() : Image
      {
         return getRef("buff_icon");
      }
      
      public function bind(param1:View) : PeakSportsFightResultRenderControl
      {
         render = param1;
         return this;
      }
      
      public function setData(param1:FastPeakSportsData, param2:BkFightInfo) : void
      {
         bgFightInfo = param2;
         playerData = param1;
         validateAll();
      }
      
      public function validateAll() : void
      {
         validateBuffIcon();
         validateImgHead();
         validateName();
         validateFightValue();
         validateFightValueBg();
         validateBg();
         validateLevel();
         validateHp(false);
         validateProgressValue(false);
         validateHeroes(false);
      }
      
      public function validateBuffIcon() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         if(ref_buff_icon)
         {
            _loc2_ = new BuffRenderS1UI();
            _loc1_ = playerData.conDeathNum;
            if(_loc1_ > 0)
            {
               _loc2_.dataSource = new BuffHasLayersVo(DefindConsts.BG_DEATH_BUFF.split("|")[0],_loc1_);
               this.ref_buff_icon.addChild(_loc2_);
               _loc2_.toolTip = LocaleMgr.ins.getStr(50500141,[_loc2_.layers,_loc2_.layers * 5]);
               if(isLeft)
               {
                  _loc3_ = _loc3_ + (_loc2_.width + 6);
               }
               else
               {
                  _loc3_ = _loc3_ - (_loc2_.width + 6);
               }
            }
            if(playerData.sideKillNpcNum > 0)
            {
               _loc4_ = (DefindConsts.BG_FIRE_KILL_NPC_BUFFS as String).split("|")[0];
               _loc5_ = StcMgr.ins.getBuffVo(_loc4_);
               _loc1_ = playerData.sideKillNpcNum;
               _loc2_ = new BuffRenderS1UI();
               _loc2_.dataSource = new BuffHasLayersVo(_loc4_,_loc1_);
               this.ref_buff_icon.addChild(_loc2_);
               _loc2_.toolTip = LocaleMgr.ins.getStr(50500177,[_loc1_,(Number(_loc1_ * _loc5_.init_effect_value1 * 100)).toFixed(3)]);
               _loc2_.x = _loc3_;
               if(isLeft)
               {
                  _loc3_ = _loc3_ + (_loc2_.width + 6);
               }
               else
               {
                  _loc3_ = _loc3_ - (_loc2_.width + 6);
               }
            }
         }
      }
      
      public function validateImgHead() : void
      {
         var _loc1_:* = null;
         if(ref_img_head_render)
         {
            _loc1_ = new PlayerVo();
            _loc1_.baseId = playerData.npcID;
            _loc1_.playerId = playerData.playerId;
            _loc1_.militaryRank = playerData.miliRank;
            ref_img_head_render.dataSource = _loc1_;
         }
      }
      
      public function validateName() : void
      {
         if(ref_txt_name)
         {
            this.ref_txt_name.text = TextFieldUtil.htmlText2(playerData.name,ColorLib.getMilitaryColor(playerData.miliRank));
         }
      }
      
      public function validateFightValue() : void
      {
         if(ref_fight_value)
         {
            (this.ref_fight_value as IFightValueBox).value = Uint64Util.toInt(playerData.fightValue);
         }
      }
      
      public function validateFightValueBg() : void
      {
         if(ref_img_fight_value_bg)
         {
            this.ref_img_fight_value_bg.skin = "png.a5.commonImgs.img_fightBg" + playerData.side;
         }
      }
      
      public function validateLevel() : void
      {
         if(ref_txt_level)
         {
            this.ref_txt_level.text = LocaleConsts.lvStr(playerData.level);
         }
      }
      
      public function validateHp(param1:Boolean) : void
      {
         if(ref_progressBar_hp)
         {
            if(param1 == false)
            {
               TweenLite.to(this.ref_progressBar_hp,0.2,{"value":getTotalHpPercent(bgFightInfo.initPlayer,true)});
            }
            else
            {
               TweenLite.to(this.ref_progressBar_hp,0.2,{"value":getTotalHpPercent(bgFightInfo.resultPlayer)});
            }
         }
      }
      
      public function validateProgressValue(param1:Boolean) : void
      {
         if(ref_txt_progress_value)
         {
            if(param1 == false)
            {
               this.ref_txt_progress_value.text = LocaleConsts.percentStr(getTotalHpPercent(bgFightInfo.initPlayer,true));
            }
            else
            {
               this.ref_txt_progress_value.text = LocaleConsts.percentStr(getTotalHpPercent(bgFightInfo.resultPlayer));
            }
         }
      }
      
      public function validateHeroes(param1:Boolean) : void
      {
         if(ref_list_heroes)
         {
            if(param1 == false)
            {
               initPlayers();
               this.ref_list_heroes.dataSource = PeakSportsFightHeroVo.createFightHeroArr(_initPlayers,param1);
            }
            else
            {
               this.ref_list_heroes.dataSource = PeakSportsFightHeroVo.createFightHeroArr(_resultPlayers,param1);
            }
         }
      }
      
      private function initPlayers() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = bgFightInfo.initPlayer.length;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            _initPlayers[bgFightInfo.initPlayer[_loc1_].posId] = bgFightInfo.initPlayer[_loc1_];
            _loc1_++;
         }
         var _loc4_:int = bgFightInfo.resultPlayer.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _resultPlayers[bgFightInfo.resultPlayer[_loc2_].posId] = bgFightInfo.resultPlayer[_loc2_];
            _loc2_++;
         }
      }
      
      public function validateBg() : void
      {
         if(ref_img_bg)
         {
            this.ref_img_bg.skin = "png.a5.commonImgs.img_bg" + playerData.side;
         }
      }
      
      public function validateDamage() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = getTotalHp(bgFightInfo.initPlayer,true) - getTotalHp(bgFightInfo.resultPlayer);
         if(_loc3_ < 0)
         {
            _loc2_ = TextFieldUtil.htmlText2("HP +" + Math.abs(_loc3_),458496);
         }
         else
         {
            _loc2_ = TextFieldUtil.htmlText2("HP -" + Math.abs(_loc3_),16723968);
         }
         var _loc1_:AlertMsgVo = new AlertMsgVo(_loc2_);
         var _loc4_:SimpleStrMsg = new SimpleStrMsg(_loc1_);
         _loc4_.centerX = 0;
         _loc4_.centerY = 0;
         this.render.addChild(_loc4_);
         _loc4_.fadeIn();
      }
      
      public function getTotalHpPercent(param1:Array, param2:Boolean = false) : Number
      {
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.kind != 21)
            {
               if(param2)
               {
                  _loc4_ = Number(_loc4_ + (_loc3_.prop.hp + FPUtil.getAddHpByBuff(_loc3_)));
                  _loc5_ = Number(_loc5_ + _loc3_.hpMax);
               }
               else
               {
                  _loc4_ = Number(_loc4_ + _loc3_.prop.hp);
                  _loc5_ = Number(_loc5_ + _loc3_.hpMax);
               }
            }
         }
         return _loc4_ / _loc5_;
      }
      
      public function getTotalHp(param1:Array, param2:Boolean = false) : Number
      {
         var _loc4_:* = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.kind != 21)
            {
               if(param2)
               {
                  _loc4_ = Number(_loc4_ + (_loc3_.prop.hp + FPUtil.getAddHpByBuff(_loc3_)));
               }
               else
               {
                  _loc4_ = Number(_loc4_ + _loc3_.prop.hp);
               }
            }
         }
         return _loc4_;
      }
      
      public function toEnd() : void
      {
         validateDamage();
         validateHp(true);
         validateProgressValue(true);
         validateHeroes(true);
      }
      
      public function dispose() : void
      {
      }
   }
}
