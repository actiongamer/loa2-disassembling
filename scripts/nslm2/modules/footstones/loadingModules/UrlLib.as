package nslm2.modules.footstones.loadingModules
{
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.configs.EnvConfig;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   
   public class UrlLib
   {
      
      public static const IN_3D:String = "3d/";
      
      public static const NO_3D:String = "__no3d/";
       
      
      public function UrlLib()
      {
         super();
      }
      
      public static function piece_tip() : String
      {
         return "modules/footstones/commons/piece_tip.png";
      }
      
      public static function piece_tip_big() : String
      {
         return "modules/footstones/commons/piece_tip_big.png";
      }
      
      public static function mailDefaultIcon() : String
      {
         return "modules/foundations/mails/defaultIcon.png";
      }
      
      public static function gameMainRim() : String
      {
         return "modules/footstones/gameMainRim.png";
      }
      
      public static function img_logo() : String
      {
         return "img/loading/logo.png";
      }
      
      public static function asset3d(param1:String) : String
      {
         return "3d/" + param1;
      }
      
      public static function redPoint3d() : String
      {
         return "img/img_redPoint.png";
      }
      
      public static function propS2(param1:int) : String
      {
         return "img/icons/propS2/" + param1 + ".png";
      }
      
      public static function skyboxUrl(param1:String) : String
      {
         return "img/skybox/" + param1 + "/px.png";
      }
      
      public static function panelTitle(param1:int) : String
      {
         return "img/panelTitles/" + param1 + ".png";
      }
      
      public static function panelBgs(param1:int) : String
      {
         return "img/panelBgs/" + param1 + ".png";
      }
      
      public static function playerHeaderIcon(param1:*) : String
      {
         return "img/playerHeaderIcon/" + param1 + ".png";
      }
      
      public static function loadingImg(param1:String) : String
      {
         return "img/loading/" + param1 + ".png";
      }
      
      public static function headIcon(param1:String) : String
      {
         return "img/head/" + param1 + ".jpg";
      }
      
      public static function headRoundIcon(param1:String) : String
      {
         return "img/head_round/" + param1 + ".png";
      }
      
      public static function npcDialogIcon(param1:String) : String
      {
         return "img/npc_dialog/" + param1 + ".jpg";
      }
      
      public static function tipMenuIcon(param1:int) : String
      {
         return "img/icons/tipMenus/" + param1 + ".png";
      }
      
      public static function dgScript(param1:int) : String
      {
         if(param1 == 0)
         {
            return "";
         }
         if(ClientConfig.firstBattle == 1)
         {
            return "scripts/" + param1 + "_" + EnvConfig.ins.firstBattleType + ".json";
         }
         return "scripts/" + param1 + ".json";
      }
      
      public static function chapterScript(param1:int) : String
      {
         return "scripts/chapter/" + param1 + ".json";
      }
      
      public static function cityScript(param1:int) : String
      {
         return "scripts/city/" + param1 + ".json";
      }
      
      public static function bottomMsgIcon(param1:int) : String
      {
         return "img/icons/bottomMsg/" + param1 + ".png";
      }
      
      public static function itemIcon(param1:int) : String
      {
         return "img/item/" + param1 + ".png";
      }
      
      public static function itemMiniIcon(param1:int) : String
      {
         return "img/item_mini/" + param1 + ".png";
      }
      
      public static function itemIconLong(param1:int) : String
      {
         return "img/item_long/" + param1 + ".png";
      }
      
      public static function skillIcon(param1:uint) : String
      {
         return "img/skill/" + param1 + ".png";
      }
      
      public static function phaseUpTalentIcon(param1:int) : String
      {
         return "img/phaseUpTalent/" + param1 + ".png";
      }
      
      public static function buffIcon(param1:uint) : String
      {
         return "img/buff/" + param1 + ".png";
      }
      
      public static function mengYueIcon(param1:uint) : String
      {
         return "modules/cultivates/roleInfos/mengYueIcons/" + param1 + ".jpg";
      }
      
      public static function roleBg(param1:uint) : String
      {
         return "modules/cultivates/roleInfos/roleBg/" + param1 + ".jpg";
      }
      
      public static function shenyuanMonster(param1:String) : String
      {
         return "modules/cultivates/roleInfos/roleBgLong/" + param1 + ".jpg";
      }
      
      public static function propIcon(param1:uint) : String
      {
         return "img/icons/prop/" + param1 + ".png";
      }
      
      public static function chapterMapBg(param1:int) : String
      {
         return "modules/chapters/chapterModuleBg/mapBg/" + param1 + ".jpg";
      }
      
      public static function chapterMapRoute(param1:int) : String
      {
         return "modules/chapters/chapterModuleBg/route/" + param1 + ".png";
      }
      
      public static function dialog(param1:*) : String
      {
         return "img/dialog/" + param1 + ".png";
      }
      
      public static function mainToolBarIcon(param1:int, param2:String = "") : String
      {
         return "modules/foundations/mainToolbar/icons/" + param1 + param2 + ".png";
      }
      
      public static function foreshowToolBarIcon(param1:String, param2:String = "") : String
      {
         return "modules/foundations/mainToolbar/icons/" + param1 + param2 + ".png";
      }
      
      public static function mainToolBarIconSmall(param1:String, param2:String = "") : String
      {
         return "modules/foundations/mainToolbar/icons/icons_small/" + param1 + param2 + ".png";
      }
      
      public static function mainToolBarNames(param1:int) : String
      {
         return "modules/foundations/mainToolbar/names/" + param1 + ".png";
      }
      
      public static function moduleIconForGetPoint(param1:int) : String
      {
         return "modules/footstones/resGetPoints/icons/" + param1 + ".png";
      }
      
      public static function moduleNewerAlertIcon(param1:int) : String
      {
         return "modules/footstones/newerAlert/" + param1 + ".png";
      }
      
      public static function moduleMallBarginBg(param1:int) : String
      {
         return "modules/foundations/mall/" + param1 + ".png";
      }
      
      public static function moduleAssets_footstones(param1:String) : String
      {
         return "modules/foundations/" + param1;
      }
      
      public static function e3d_particle(param1:String) : String
      {
         return "particle/" + param1;
      }
      
      public static function ng_role_move_arrow() : String
      {
         return "modules/footstones/newGuides/img_arrowRightS3.png";
      }
      
      public static function sceneImg3D(param1:int, param2:int, param3:String) : String
      {
         return "scene/maps/" + param1 + "/" + param2 + "." + param3;
      }
      
      public static function sceneMap(param1:int) : String
      {
         return "scene/maps/" + param1 + "/";
      }
      
      public static function sceneSmallJpg(param1:int) : String
      {
         return sceneMap(param1) + "small.jpg";
      }
      
      public static function scenePathMask(param1:int, param2:int = 0) : String
      {
         if(param2 == 0)
         {
            return sceneMap(param1) + "path_mask.png";
         }
         return sceneMap(param1) + "path_mask_" + param2 + ".png";
      }
      
      public static function sceneMapConfig(param1:int, param2:int) : String
      {
         return "scene/maps/" + param1 + "/config" + (param2 > 0?"_" + param2:"") + ".xml";
      }
      
      public static function sceneMapTileImg(param1:int, param2:int, param3:int, param4:int, param5:Boolean) : String
      {
         if(param5)
         {
            return UrlLib.sceneMap(param1) + String(param2) + "/pngs/" + param4 + "_" + param3 + ".png";
         }
         return UrlLib.sceneMap(param1) + String(param2) + "/jpgs/" + param4 + "_" + param3 + ".jpg";
      }
      
      public static function battleBuffIcon(param1:String) : String
      {
         return "modules/battlePlayer/buff/" + param1 + ".png";
      }
      
      public static function militaryIcon(param1:int) : String
      {
         return "modules/cultivates/militaryInfos/militaryIcons/" + param1 + ".png";
      }
      
      public static function stcDev() : String
      {
         return "stc/static_dev.stc";
      }
      
      public static function stcAll() : String
      {
         return "stc/static.stc";
      }
      
      public static function stcLanguage() : String
      {
         return "stc/static_language.stc";
      }
      
      public static function stcLanguageFirst() : String
      {
         return "stc/static_language1.stc";
      }
      
      public static function stcLanguageFirstTxt() : String
      {
         return "stc/static_language1.txt";
      }
      
      public static function stcFirst(param1:int) : String
      {
         return "stc/static_" + param1 + ".stc";
      }
      
      public static function stcFirstTxt(param1:int) : String
      {
         return stcRaw() + "static_" + param1 + ".txt";
      }
      
      public static function stcRaw() : String
      {
         return "stc/raw/";
      }
      
      public static function effect3DUrl(param1:int) : String
      {
         var _loc2_:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(param1);
         return "particle/" + _loc2_.effect;
      }
      
      public static function skillConfigUrl() : String
      {
         return "scripts/skill/4.png";
      }
      
      public static function getArenaBg(param1:String) : String
      {
         return "scene/arena/" + param1;
      }
      
      public static function teamGuajiSceneBg(param1:String) : String
      {
         return "modules/funnies/teamGuaji/" + param1;
      }
      
      public static function getClientDownImg() : String
      {
         return "img/favorite/1.png";
      }
      
      public static function getFavoriteImg() : String
      {
         return "img/favorite/2.png";
      }
      
      public static function getMonthlyCardImg(param1:String) : String
      {
         return "img/monthlyCard/" + param1 + ".png";
      }
      
      public static function getVipLvlUpImg(param1:String) : String
      {
         return "img/vipLvlUp/" + param1 + ".png";
      }
      
      public static function getVipAuthTitleImg(param1:int, param2:Boolean) : String
      {
         return "img/vipAuth/img_label" + param1 + (!!param2?"hl":"") + ".png";
      }
      
      public static function getGameHelpTitleImg(param1:int, param2:Boolean) : String
      {
         return "img/gameHelp/img_label" + param1 + (!!param2?"hl":"") + ".png";
      }
      
      public static function getGameHelpImg(param1:String) : String
      {
         return "img/gameHelp/" + param1 + ".png";
      }
      
      public static function getGameMasterImg(param1:String, param2:Boolean = false) : String
      {
         return "img/gameMaster/" + param1 + (!!param2?".jpg":".png");
      }
      
      public static function getSalesDiscountImg(param1:String) : String
      {
         return "img/sales/" + param1 + ".png";
      }
      
      public static function getFundImg(param1:String) : String
      {
         return "img/fund/" + param1 + ".png";
      }
      
      public static function getTencentImg(param1:String) : String
      {
         return "img/tencent/" + param1 + ".png";
      }
      
      public static function getQQVipImg(param1:String) : String
      {
         return "img/tencent/" + getQQVipTypeFolder() + param1 + ".png";
      }
      
      public static function getQQVipTypeFolder() : String
      {
         switch(int(EnvConfig.ins.vipType) - 1)
         {
            case 0:
               return "yellow/";
            case 1:
               return "blue/";
         }
      }
      
      public static function getQihooImg(param1:String) : String
      {
         return "img/qihoo/" + param1 + ".png";
      }
      
      public static function getSogouImg(param1:String) : String
      {
         return "img/sogou/" + param1 + ".png";
      }
      
      public static function getDuowanImg(param1:String) : String
      {
         return "img/duowan/" + param1 + ".png";
      }
      
      public static function getPlayerTitleFuncImg(param1:String) : String
      {
         return "modules/funnies/playerTitle/" + param1 + ".png";
      }
      
      public static function getPlayerTitleImg(param1:int, param2:Boolean = true) : String
      {
         return (!!param2?"3d/":"") + "modules/funnies/playerTitle/titles/" + param1 + ".png";
      }
      
      public static function get2dEffImg(param1:String) : String
      {
         return param1 + ".png";
      }
      
      public static function getShenYuanBg(param1:String) : String
      {
         return "scene/shenyuan/" + param1;
      }
      
      public static function get3DCommonImg(param1:String) : String
      {
         return "modules/common/" + param1 + ".png";
      }
      
      public static function getGuajiImg(param1:String) : String
      {
         return "scene/guaji/" + param1 + ".png";
      }
      
      public static function horseUrl(param1:int) : String
      {
         return "modules/cultivates/horseInfos/" + param1 + ".png";
      }
      
      public static function guildActivityRenderBg(param1:int) : String
      {
         return "modules/funnies/guild/base/img_FunBg" + param1 + ".png";
      }
      
      public static function activityForeshowImg(param1:String) : String
      {
         return "new_function/" + param1 + ".jpg";
      }
      
      public static function guildFlagBg(param1:int) : String
      {
         return "img/flag/bg/" + param1 + ".png";
      }
      
      public static function guildFlagPattern(param1:int) : String
      {
         return "img/flag/pattern/" + param1 + ".png";
      }
      
      public static function guildMapBg(param1:int) : String
      {
         return "modules/guilds/guildModuleBg/mapBg/" + param1 + ".png";
      }
      
      public static function guildMapRoute(param1:int) : String
      {
         return "modules/guilds/guildModuleBg/mapRoute/" + param1 + ".png";
      }
      
      public static function guildDungeonIcon(param1:int) : String
      {
         return "modules/guilds/guildDungeonIcon/" + param1 + ".png";
      }
      
      public static function moduleImgAsset(param1:int, param2:String) : String
      {
         return "modules/bg/" + param1 + "/" + param2;
      }
      
      public static function soundEffect(param1:String) : String
      {
         return "sound/effect/" + param1 + ".mp3";
      }
      
      public static function soundBack(param1:String) : String
      {
         return "sound/back/" + param1 + ".mp3";
      }
      
      public static function default_avatar() : String
      {
         return "scene/default_avatar.png";
      }
      
      public static function npcGroupImg(param1:int) : String
      {
         return "img/groupImg/" + param1 + ".png";
      }
      
      public static function npcName(param1:*) : String
      {
         return "img/npcNames/" + param1 + ".png";
      }
      
      public static function npcTypeImg(param1:int) : String
      {
         return "img/npcTypeImg/" + param1 + ".png";
      }
      
      public static function npcQualityBg(param1:int) : String
      {
         return "img/npcQualityBg/" + param1 + ".png";
      }
      
      public static function showHeroRenderBgs(param1:int) : String
      {
         return "img/showHeroRenderBgs/" + param1 + ".png";
      }
      
      public static function npcTypeIcon(param1:int) : String
      {
         return "img/npcTypeIcon/" + param1 + ".png";
      }
      
      public static function npcPieceQualityBg(param1:int) : String
      {
         return "img/npcPieceQualityBg/" + param1 + ".png";
      }
      
      public static function moduleLocaleImg(param1:int, param2:String) : String
      {
         return "img/localeImgs/modules/" + param1 + "/" + param2 + ".png";
      }
      
      public static function battleHead(param1:String) : String
      {
         return "img/battleHead/" + param1 + ".png";
      }
      
      public static function discountIconLeft(param1:int) : String
      {
         return "img/discount/left/discount" + param1 + ".png";
      }
      
      public static function discountIconRight(param1:int) : String
      {
         return "img/discount/right/discount" + param1 + ".png";
      }
      
      public static function towerBuffIcon(param1:String) : String
      {
         return "img/towerbuff/" + param1 + ".png";
      }
      
      public static function npcFuncListBg(param1:int) : String
      {
         return "modules/funnies/npcFuncList/bg/" + param1 + ".png";
      }
      
      public static function npcFuncListTitle(param1:int) : String
      {
         return "modules/funnies/npcFuncList/names/" + param1 + ".png";
      }
      
      public static function npcFuncListIcon(param1:int) : String
      {
         return "modules/funnies/npcFuncList/icons/" + param1 + ".png";
      }
      
      public static function npcFuncListMultiples(param1:int) : String
      {
         return "modules/funnies/npcFuncList/multiples/" + param1 + ".png";
      }
      
      public static function battleLossFunImg(param1:int) : String
      {
         return "modules/battleResult/" + param1 + ".png";
      }
      
      public static function runeTypeIcon(param1:int) : String
      {
         return "img/runeIcon/" + param1 + ".png";
      }
      
      public static function resIcon(param1:String) : String
      {
         return "img/resDg/" + param1 + ".png";
      }
      
      public static function hintBoxIcon(param1:int) : String
      {
         return "img/hint_box/" + param1 + ".png";
      }
      
      public static function sevenDayHalfPrice() : String
      {
         return "img/seven_day/halfpriceBG.png";
      }
      
      public static function sevenDaySalesTitle() : String
      {
         return "img/seven_day/salesTitle.png";
      }
      
      public static function sevenDaySalesBG() : String
      {
         return "img/seven_day/salesBG.png";
      }
      
      public static function getValentineImg(param1:String) : String
      {
         return "img/valentine/" + param1 + ".png";
      }
      
      public static function getLanternImg(param1:String) : String
      {
         return "img/lantern/" + param1 + ".png";
      }
      
      public static function sevenDayDailyGift() : String
      {
         return "img/seven_day/dailygiftBG.jpg";
      }
      
      public static function sevenDayGiftIcon(param1:int) : String
      {
         return "img/seven_day/img_gift" + param1 + ".png";
      }
      
      public static function fouteenDayGiftIcon(param1:int) : String
      {
         return "img/fourteen_day/img_gift" + param1 + ".png";
      }
      
      public static function newYearDayGiftIcon(param1:int) : String
      {
         return "modules/funnies/newYear2016/daily/img_gift" + param1 + ".png";
      }
      
      public static function sevenDayTask(param1:int, param2:int, param3:int) : String
      {
         if(param1 == 1)
         {
            return "img/seven_day/img_taskBG" + param2 + "_day" + param3 + ".png";
         }
         return "img/seven_day/img_task" + param2 + "_day" + param3 + ".png";
      }
      
      public static function fourteenDayTask(param1:int, param2:int, param3:int) : String
      {
         if(param1 == 1)
         {
            return "img/seven_day/img_taskBG" + param2 + "_day" + param3 + ".png";
         }
         return "img/seven_day/img_task" + param2 + "_day" + param3 + ".png";
      }
      
      public static function sevenDayIcon(param1:int) : String
      {
         return "img/seven_day/img_day" + param1 + ".png";
      }
      
      public static function fourteenDayTitleIcon(param1:int) : String
      {
         return "img/fourteen_day/img_icon" + param1 + ".png";
      }
      
      public static function sevenDayTitleIcon(param1:int) : String
      {
         return "img/seven_day/img_icon" + param1 + ".png";
      }
      
      public static function sevenDayGoodsIcon(param1:int, param2:int) : String
      {
         if(param1 == 1)
         {
            return "img/seven_day/img_goodsBG" + param2 + ".png";
         }
         return "img/seven_day/img_goods" + param2 + ".png";
      }
      
      public static function funcOpenIcon(param1:int) : String
      {
         return "modules/funcOpen/" + param1 + ".png";
      }
      
      public static function getChampionshipImg(param1:String) : String
      {
         return "scene/championship/" + param1;
      }
      
      public static function tupoCpl_img_floor() : String
      {
         return "img/img_floor.png";
      }
      
      public static function img_firstCharge() : String
      {
         return "img/img_firstCharge.png";
      }
      
      public static function img_buzhenBg() : String
      {
         return "img/img_NameBg_2.png";
      }
      
      public static function getBannerImg(param1:String) : String
      {
         return "img/mallBanner/" + param1;
      }
      
      public static function sceneNpcIcon(param1:int) : String
      {
         return "modules/funnies/npcFuncList/scene_icons/" + param1 + ".png";
      }
      
      public static function battlefieldSideIcon(param1:int) : String
      {
         return "modules/battlefields/sideIcon/" + param1 + ".png";
      }
      
      public static function battlefieldSideBg(param1:int) : String
      {
         return "modules/battlefields/sideBg/" + param1 + ".png";
      }
      
      public static function battlefieldSideAllFor3D(param1:int) : String
      {
         return "modules/battlefields/sideAllFor3D/" + param1 + ".png";
      }
      
      public static function battlefieldFlagFor3D(param1:int) : String
      {
         return "modules/battlefields/flagFor3D/" + param1 + ".png";
      }
      
      public static function battlefieldMiniMap(param1:int) : String
      {
         return "modules/battlefields/miniMap/" + param1 + ".png";
      }
      
      public static function battlefieldTitle(param1:int) : String
      {
         return "modules/battlefields/titleImg/" + param1 + ".png";
      }
      
      public static function battlefieldPlayerTitle(param1:int) : String
      {
         return "modules/battlefields/playerTitle/" + param1 + ".png";
      }
      
      public static function battlefieldOther(param1:String) : String
      {
         return "modules/battlefields/others/" + param1 + ".png";
      }
      
      public static function battlefieldDegreeIcon(param1:int) : String
      {
         return "modules/battlefields/degreeIcon/" + param1 + ".png";
      }
      
      public static function battlefieldUI(param1:String) : String
      {
         return "modules/battlefields/ui/" + param1 + ".png";
      }
      
      public static function battlefieldBg(param1:String) : String
      {
         return "modules/battlefields/ui/" + param1;
      }
      
      public static function peakSportsSideIcon(param1:int) : String
      {
         return "modules/peakSports/sideIcon/" + param1 + ".png";
      }
      
      public static function peakSportsSideBg(param1:int) : String
      {
         return "modules/peakSports/sideBg/" + param1 + ".png";
      }
      
      public static function peakSportsSideAllFor3D(param1:int) : String
      {
         return "modules/peakSports/sideAllFor3D/" + param1 + ".png";
      }
      
      public static function peakSportsMiniMap(param1:int) : String
      {
         return "modules/peakSports/miniMap/" + param1 + ".png";
      }
      
      public static function peakSportsUI(param1:String) : String
      {
         return "modules/peakSports/ui/" + param1 + ".png";
      }
      
      public static function awakingRoadImg(param1:String) : String
      {
         return "modules/fights/awakingRoad/" + param1;
      }
      
      public static function speakUrl(param1:int, param2:int) : String
      {
         if(ClientConfig.isChineseLang())
         {
            return "npc/" + param1 + "_" + param2;
         }
         if(App.language == "ru")
         {
            return "npc_ru/" + param1 + "_" + param2;
         }
         if(App.language == "tr")
         {
            return "npc_tr/" + param1 + "_" + param2;
         }
         return "npc_en/" + param1 + "_" + param2;
      }
      
      public static function newerGuideSpeakUrl(param1:int) : String
      {
         if(ClientConfig.isChineseLang())
         {
            return "newerGuide/" + param1;
         }
         if(App.language == "ru")
         {
            return "newerGuide_ru/" + param1;
         }
         if(App.language == "tr")
         {
            return "newerGuide_tr/" + param1;
         }
         return "newerGuide_en/" + param1;
      }
      
      public static function shopUI(param1:String) : String
      {
         return "modules/shops/" + param1 + ".png";
      }
      
      public static function pkCrossSerUrl(param1:String) : String
      {
         return "img/pkCrossSer/" + param1;
      }
      
      public static function reinforceTrainUrl(param1:String) : String
      {
         return "img/reinforceTrain/" + param1;
      }
      
      public static function gpkcUrl(param1:String) : String
      {
         return "img/gpkc/" + param1;
      }
      
      public static function tpkcUrl(param1:String) : String
      {
         return "img/tpkc/" + param1;
      }
      
      public static function getGuildManageIcon(param1:int) : String
      {
         return "modules/guilds/icon/" + param1 + ".png";
      }
      
      public static function chatHeadIcon(param1:String) : String
      {
         return "img/chat/" + param1 + ".jpg";
      }
      
      public static function renZhengWeiXinAndPhone(param1:String) : String
      {
         return "modules/funnies/renZheng/weixinAndPhone/" + param1 + ".png";
      }
      
      public static function heroAwakenRoadChapterMapBg(param1:int) : String
      {
         return "modules/heroAwakenRoad/map/" + param1 + ".jpg";
      }
      
      public static function heroAwakenRoadChapterMapLine(param1:int) : String
      {
         return "modules/heroAwakenRoad/line/L" + param1 + ".png";
      }
      
      public static function funcIcon(param1:int) : String
      {
         return "img/func/" + param1 + ".png";
      }
      
      public static function get fbPictureUrl() : String
      {
         return ClientConfig.publishPath + "assets/" + App.language + "/fb/";
      }
      
      public static function countryFlag(param1:String) : String
      {
         return "img/countryflag/" + param1 + ".png";
      }
      
      public static function funcResBackIcon(param1:int) : String
      {
         return "modules/foundations/mainToolbar/icons/" + param1 + ".png";
      }
      
      public static function dialModule(param1:String) : String
      {
         return "modules/funnies/dial/" + param1 + ".png";
      }
      
      public static function getResBackUrl(param1:String) : String
      {
         return "img/resBack/" + param1;
      }
      
      public static function day51help(param1:int) : String
      {
         return "modules/funnies/day51/img_" + param1 + ".jpg";
      }
      
      public static function secretUrl(param1:String) : String
      {
         return "img/secretExplore/" + param1;
      }
      
      public static function olmpicCountryFlagUrl(param1:String) : String
      {
         return "img/olmpicCountryFlag/" + param1 + ".png";
      }
   }
}
