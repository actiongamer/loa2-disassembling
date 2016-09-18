package nslm2.modules.foundations.setting.model
{
   import com.mz.core.mgrs.ObserverMgr;
   import org.specter3d.context.AppGlobalContext;
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import nslm2.mgrs.SoundMgr;
   import proto.SystemSettingData;
   import com.mz.core.utils.DictHash;
   
   public class SettingModel
   {
      
      private static var _ins:nslm2.modules.foundations.setting.model.SettingModel;
       
      
      public var firstRunFlag:Boolean = true;
      
      public var graphicQuality:int = 1;
      
      public var resoRatio:int = 0;
      
      public var animeQuality:int = 2;
      
      private var _peopleNum:int = 0;
      
      private var _antiAlias:int = 1;
      
      private var _otherPlayers:int = 0;
      
      public var deathFlash:int = 0;
      
      private var _sceneSpecEffect:int = 0;
      
      private var _otherSpecEffect:int = 0;
      
      public var otherTitle:int = 0;
      
      private var _npcDisplay:int = 0;
      
      public var soundQuality:int = 2;
      
      private var _mainVolume:int = 100;
      
      private var _backVolume:int = 100;
      
      private var _battleVolume:int = 100;
      
      public var systemVolume:int = 100;
      
      private var _uiVolume:int = 100;
      
      public var dialogVolume:int = 100;
      
      public var refuseAll:Boolean = false;
      
      public var refuseFriend:Boolean = false;
      
      public var refuseStranger:Boolean = false;
      
      public var refuseGuilt:Boolean = false;
      
      public var refuseAllPeople:Boolean = false;
      
      public var refusePVP:Boolean = false;
      
      public var refuseStrangerMail:Boolean = false;
      
      public var selectAllPayHint:Boolean = true;
      
      private var selectPayHint1:Boolean = true;
      
      private var selectPayHint2:Boolean = true;
      
      private var selectPayHint3:Boolean = true;
      
      private var selectPayHint4:Boolean = true;
      
      private var selectPayHint5:Boolean = true;
      
      private var selectPayHint6:Boolean = true;
      
      private var selectPayHint7:Boolean = true;
      
      private var selectPayHint8:Boolean = true;
      
      private var selectPayHint9:Boolean = true;
      
      private var selectPayHint10:Boolean = true;
      
      public var defaultSetting:Array;
      
      private var _allHints:DictHash;
      
      public function SettingModel()
      {
         super();
         initSetting();
      }
      
      public static function get ins() : nslm2.modules.foundations.setting.model.SettingModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.setting.model.SettingModel();
         }
         return _ins;
      }
      
      public function get peopleNum() : int
      {
         return _peopleNum;
      }
      
      public function set peopleNum(param1:int) : void
      {
         _peopleNum = param1;
         ObserverMgr.ins.sendNotice("MSG_SEE_OTHERS_NUMBER_SWITCH");
      }
      
      public function get antiAlias() : int
      {
         return _antiAlias;
      }
      
      public function set antiAlias(param1:int) : void
      {
         _antiAlias = param1;
         if(AppGlobalContext.stage3d)
         {
            AppGlobalContext.stage3d.view3d.antiAlias = _antiAlias == 0?2:0;
         }
      }
      
      public function get otherPlayers() : int
      {
         return _otherPlayers;
      }
      
      public function set otherPlayers(param1:int) : void
      {
         if(param1 != _otherPlayers)
         {
            _otherPlayers = param1;
            ObserverMgr.ins.sendNotice("msg_other_players_VISIBLE");
         }
      }
      
      public function get sceneSpecEffect() : int
      {
         return _sceneSpecEffect;
      }
      
      public function set sceneSpecEffect(param1:int) : void
      {
         _sceneSpecEffect = param1;
         ObserverMgr.ins.sendNotice("settingNoticeSceneSpecialEffOnOff");
      }
      
      public function get otherSpecEffect() : int
      {
         return _otherSpecEffect;
      }
      
      public function set otherSpecEffect(param1:int) : void
      {
         _otherSpecEffect = param1;
         ObserverMgr.ins.sendNotice("MSG_SEE_OTHERS_EFFECT_SWITCH");
      }
      
      public function get npcDisplay() : int
      {
         return _npcDisplay;
      }
      
      public function set npcDisplay(param1:int) : void
      {
         _npcDisplay = param1;
         ObserverMgr.ins.sendNotice("MSG_SEE_NPCS_SWITCH");
      }
      
      public function get mainVolume() : int
      {
         return _mainVolume;
      }
      
      public function set mainVolume(param1:int) : void
      {
         if(param1 != _mainVolume)
         {
            _mainVolume = param1;
            ObserverMgr.ins.sendNotice("msg_sound_MUTE");
         }
         SoundMixer.soundTransform = new SoundTransform(nslm2.modules.foundations.setting.model.SettingModel.ins.mainVolume / 100);
      }
      
      public function get backVolume() : int
      {
         return _backVolume;
      }
      
      public function set backVolume(param1:int) : void
      {
         _backVolume = param1;
         SoundMgr.ins.updateBackVolume();
      }
      
      public function get battleVolume() : int
      {
         return _battleVolume;
      }
      
      public function set battleVolume(param1:int) : void
      {
         _battleVolume = param1;
      }
      
      public function get uiVolume() : int
      {
         return _uiVolume;
      }
      
      public function set uiVolume(param1:int) : void
      {
         _uiVolume = param1;
      }
      
      public function initSetting() : void
      {
         defaultSetting = getAllSettings().concat();
      }
      
      public function getAllFunction(param1:Array = null) : Array
      {
         if(!param1)
         {
            param1 = [];
         }
         param1.push(refuseAll);
         param1.push(refuseFriend);
         param1.push(refuseStranger);
         param1.push(refuseGuilt);
         param1.push(refuseAllPeople);
         param1.push(refusePVP);
         param1.push(refuseStrangerMail);
         return param1;
      }
      
      public function getAllSound(param1:Array = null) : Array
      {
         if(!param1)
         {
            param1 = [];
         }
         param1.push(soundQuality);
         param1.push(mainVolume);
         param1.push(backVolume);
         param1.push(battleVolume);
         param1.push(systemVolume);
         param1.push(uiVolume);
         param1.push(dialogVolume);
         return param1;
      }
      
      public function getAllGraphic(param1:Array = null) : Array
      {
         if(!param1)
         {
            param1 = [];
         }
         param1.push(graphicQuality);
         param1.push(resoRatio);
         param1.push(animeQuality);
         param1.push(peopleNum);
         param1.push(antiAlias);
         param1.push(otherPlayers);
         param1.push(deathFlash);
         param1.push(sceneSpecEffect);
         param1.push(otherSpecEffect);
         param1.push(otherTitle);
         param1.push(npcDisplay);
         return param1;
      }
      
      public function getAllHint(param1:Array = null) : Array
      {
         if(!param1)
         {
            param1 = [];
         }
         var _loc2_:int = 0;
         if(_allHints)
         {
            param1.push(selectAllPayHint);
            while(_loc2_ < 10)
            {
               param1.push(getHintById(10900052 + _loc2_));
               _loc2_++;
            }
         }
         else
         {
            while(_loc2_ < 11)
            {
               param1.push(true);
               _loc2_++;
            }
         }
         return param1;
      }
      
      private function strToBool(param1:*) : Boolean
      {
         if(param1 as SystemSettingData)
         {
            return param1.s == "true"?true:false;
         }
         return param1;
      }
      
      private function strToNum(param1:*) : int
      {
         if(param1 as SystemSettingData)
         {
            return int(param1.s);
         }
         return param1;
      }
      
      public function setAllFunction(param1:Array) : void
      {
         refuseAll = strToBool(param1[0]);
         refuseFriend = strToBool(param1[1]);
         refuseStranger = strToBool(param1[2]);
         refuseGuilt = strToBool(param1[3]);
         refuseAllPeople = strToBool(param1[4]);
         refusePVP = strToBool(param1[5]);
         refuseStrangerMail = strToBool(param1[6]);
      }
      
      public function setAllSound(param1:Array) : void
      {
         soundQuality = strToNum(param1[0]);
         mainVolume = strToNum(param1[1]);
         backVolume = strToNum(param1[2]);
         battleVolume = strToNum(param1[3]);
         systemVolume = strToNum(param1[4]);
         uiVolume = strToNum(param1[5]);
         dialogVolume = strToNum(param1[6]);
      }
      
      public function setAllGraphic(param1:Array) : void
      {
         graphicQuality = strToNum(param1[0]);
         resoRatio = strToNum(param1[1]);
         animeQuality = strToNum(param1[2]);
         peopleNum = strToNum(param1[3]);
         antiAlias = strToNum(param1[4]);
         otherPlayers = strToNum(param1[5]);
         deathFlash = strToNum(param1[6]);
         sceneSpecEffect = strToNum(param1[7]);
         otherSpecEffect = strToNum(param1[8]);
         otherTitle = strToNum(param1[9]);
         npcDisplay = 0;
      }
      
      public function getHintById(param1:int) : Boolean
      {
         return _allHints.getValue(param1);
      }
      
      public function setHintById(param1:int, param2:Boolean) : void
      {
         _allHints.put(param1,param2);
      }
      
      public function isHintAllSelected() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < _allHints.array.length)
         {
            if(!_allHints.array[_loc1_])
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      public function setAllHint(param1:Array) : void
      {
         selectAllPayHint = strToBool(param1.shift());
         if(!_allHints)
         {
            _allHints = new DictHash(false);
         }
         var _loc2_:int = 0;
         if(param1[0] as SystemSettingData)
         {
            while(_loc2_ < param1.length)
            {
               _allHints.put(10900052 + param1[_loc2_].id - 33,param1[_loc2_].s == "true"?true:false);
               _loc2_++;
            }
         }
         else
         {
            while(_loc2_ < param1.length)
            {
               _allHints.put(10900052 + _loc2_,param1[_loc2_]);
               _loc2_++;
            }
         }
      }
      
      public function setAllSettings(param1:Array, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(!param1)
         {
            return;
         }
         if(!param2)
         {
            _loc3_ = param1.filter(filter).sortOn("id",16);
            _loc4_ = 36;
            if(_loc3_.length == _loc4_)
            {
               setAllGraphic(_loc3_.slice(0,11));
               setAllSound(_loc3_.slice(11,18));
               setAllFunction(_loc3_.slice(18,25));
               setAllHint(_loc3_.slice(25));
            }
            else
            {
               setAllGraphic(defaultSetting.slice(0,11));
               setAllSound(defaultSetting.slice(11,18));
               setAllFunction(defaultSetting.slice(18,25));
               setAllHint(defaultSetting.slice(25));
            }
         }
         else
         {
            setAllGraphic(param1.slice(0,11));
            setAllSound(param1.slice(11,18));
            setAllFunction(param1.slice(18,25));
            setAllHint(param1.slice(25));
         }
      }
      
      private function filter(param1:SystemSettingData, param2:int, param3:Array) : Boolean
      {
         return param1.id >= 7 && param1.id <= 42?true:false;
      }
      
      public function getAllSettings() : Array
      {
         var _loc1_:Array = [];
         getAllGraphic(_loc1_);
         getAllSound(_loc1_);
         getAllFunction(_loc1_);
         getAllHint(_loc1_);
         return _loc1_;
      }
   }
}
