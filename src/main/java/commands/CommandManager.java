package commands;

import io.github.cdimascio.dotenv.Dotenv;
import net.dv8tion.jda.api.EmbedBuilder;
import net.dv8tion.jda.api.events.guild.GuildReadyEvent;
import net.dv8tion.jda.api.events.interaction.command.SlashCommandInteractionEvent;
import net.dv8tion.jda.api.hooks.ListenerAdapter;
import net.dv8tion.jda.api.interactions.commands.OptionMapping;
import net.dv8tion.jda.api.interactions.commands.OptionType;
import net.dv8tion.jda.api.interactions.commands.build.CommandData;
import net.dv8tion.jda.api.interactions.commands.build.Commands;
import net.dv8tion.jda.api.interactions.commands.build.OptionData;
import net.dv8tion.jda.api.sharding.ShardManager;
import org.jetbrains.annotations.NotNull;
import net.dv8tion.jda.api.OnlineStatus;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.sql.Statement;


public class CommandManager extends ListenerAdapter {
    private enum Langues{ FR, EN };

    private ArrayList<String> tabPetitsMots;

    private static final ArrayList<String> authorizedUsers;
    static {
        authorizedUsers = new ArrayList<>();
        authorizedUsers.add("th1rox");
        authorizedUsers.add("natyk");
    }

    private Connection connexion;
    private final String url;
    private final String utilisateur;
    private final String password;

    private final ShardManager shardManager;

    public CommandManager(Dotenv config, ShardManager shardManager) throws ClassNotFoundException, SQLException {
        this.shardManager = shardManager;
        Class.forName("org.postgresql.Driver");
        this.url = "jdbc:postgresql://localhost:5432/dnd";
        this.utilisateur = config.get("DTB_ID");
        this.password = config.get("DTB_PWD");
        this.connexion = DriverManager.getConnection(this.url,this.utilisateur,this.password);
        this.tabPetitsMots = new ArrayList<>();
        extractAndAjoutPetitsMots();
    }


    @Override
    public void onSlashCommandInteraction(@NotNull SlashCommandInteractionEvent event) {
        try {
            if(this.connexion.isClosed()){
                this.connexion = DriverManager.getConnection(this.url, this.utilisateur, this.password);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String command = event.getName();
        switch (command) {
            case "sort" -> {
                try {
                    OptionMapping messageOption = event.getOption("nom");
                    String nomSort = Objects.requireNonNull(messageOption).getAsString();
                    nomSort = SpellNameCorrection(nomSort, Langues.FR);

                    String queryExact = "SELECT * FROM sort WHERE nom_sort='" + nomSort + "' LIMIT 1 OR SELECT * FROM sort WHERE alias='\" + nomSort + \"' LIMIT 1;";
                    String queryAround = "SELECT * FROM sort WHERE nom_sort like '%" + nomSort + "%' OR SELECT * FROM sort WHERE alias like '%\" + nomSort + \"%';";


                    Statement statementExact = this.connexion.createStatement();
                    ResultSet resultSetExact = statementExact.executeQuery(queryExact);

                    if (resultSetExact.next()) {
                        event.reply("Ce sort a été trouvé !").queue();
                        Sort sortTrouve = new Sort(resultSetExact, this.connexion);

                        event.getChannel().sendMessageEmbeds(sortTrouve.createEmbed().build()).queue();

                        resultSetExact.close();
                        statementExact.close();
                    } else {
                        Statement statementAround = this.connexion.createStatement();
                        ResultSet resultSetAround = statementAround.executeQuery(queryAround);

                        int i = 0;
                        while (resultSetAround.next()) {
                            if (i == 0) {
                                event.reply("Un ou plusieurs sort(s) similaire(s) ont été trouvés !").queue();
                            }
                            Sort sortTrouve = new Sort(resultSetAround, this.connexion);
                            event.getChannel().sendMessageEmbeds(sortTrouve.createEmbed().build()).queue();
                            i++;
                        }
                        if (i == 0) {
                            event.reply("Aucun sort similaire n'a été trouvé !\nFormat : _Nom du sort_ !").queue();
                        }

                        resultSetAround.close();
                        statementAround.close();
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            case "spell" -> {
                try {
                    OptionMapping messageOption = event.getOption("name");
                    String nomSort = Objects.requireNonNull(messageOption).getAsString();
                    nomSort = SpellNameCorrection(nomSort, Langues.EN);

                    String queryExact = "SELECT * FROM sort WHERE nom_sort='" + nomSort + "' LIMIT 1;";
                    String queryAround = "SELECT * FROM sort WHERE nom_sort like '%" + nomSort + "%';";


                    Statement statementExact = this.connexion.createStatement();
                    ResultSet resultSetExact = statementExact.executeQuery(queryExact);

                    if (resultSetExact.next()) {
                        event.reply("This spell has been found !").queue();
                        Sort sortTrouve = new Sort(resultSetExact, this.connexion);

                        event.getChannel().sendMessageEmbeds(sortTrouve.createEmbed().build()).queue();

                        resultSetExact.close();
                        statementExact.close();
                    } else {
                        Statement statementAround = this.connexion.createStatement();
                        ResultSet resultSetAround = statementAround.executeQuery(queryAround);

                        int i = 0;
                        while (resultSetAround.next()) {
                            if (i == 0) {
                                event.reply("One or more similar spell(s) has been found !").queue();
                            }
                            Sort sortTrouve = new Sort(resultSetAround, this.connexion);
                            event.getChannel().sendMessageEmbeds(sortTrouve.createEmbed().build()).queue();
                            i++;
                        }
                        if (i == 0) {
                            event.reply("No spell has been found !\nFormat : _Spell Name_ !").queue();
                        }

                        resultSetAround.close();
                        statementAround.close();
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            case "off" -> {
                if (authorizedUsers.contains(event.getUser().getName())) {
                    event.reply("Merci d'avoir visité ma Taverne. A bientôt soldat !").queue();
                    try {
                        this.connexion.close();
                    } catch (SQLException e) {
                        System.out.println("ERREUR : Fermeture de la connexion BDD dnd échouée");
                    }

                    this.shardManager.setStatus(OnlineStatus.OFFLINE);

                    System.exit(0);
                } else {
                    event.reply(event.getUser().getAsMention() + ": Vous n'avez pas l'autorisation d'utiliser cette commande !").queue();
                }
            }
            case "ecoles" -> {
                EmbedBuilder embed = new EmbedBuilder();
                embed.setTitle("Ecoles");

                String query = "SELECT * FROM ecole;";
                Statement statement;
                try {
                    statement = this.connexion.createStatement();
                    ResultSet resultSet = statement.executeQuery(query);

                    while (resultSet.next()) {
                        int id = resultSet.getInt("id_ecole");
                        String nom = resultSet.getString("nom_ecole");
                        embed.addField(id + "", nom, true);
                    }

                    event.getChannel().sendMessageEmbeds(embed.build()).queue();

                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            case "sort_classe" -> {
                OptionMapping classeOption = event.getOption("classe");
                OptionMapping lvlOption = event.getOption("niveau");
                String query;

                if (lvlOption != null) {
                    query = "SELECT * FROM sortClasse JOIN sort using(id_sort) JOIN classe using(id_classe) WHERE nom_classe='" + Objects.requireNonNull(classeOption).getAsString() + "' AND niveau_sort='" + Objects.requireNonNull(lvlOption).getAsInt() + "'";
                    Statement statement;
                    try {
                        statement = this.connexion.createStatement();
                        ResultSet resultSet = statement.executeQuery(query);
                        int nb = 0;
                        if (resultSet.next()) {
                            EmbedBuilder embed = new EmbedBuilder();
                            embed.setTitle("Sorts de " + Objects.requireNonNull(classeOption).getAsString());
                            embed.setThumbnail(resultSet.getString("img_classe"));
                            StringBuilder sorts = new StringBuilder();
                            do {
                                nb++;
                                sorts.append("* ").append(resultSet.getString("nom_sort")).append("\n");
                            } while (resultSet.next());

                            embed.addField("Niveau " + Objects.requireNonNull(lvlOption).getAsInt() + " (" + nb + ")", sorts.toString(), false);
                            if (Objects.requireNonNull(lvlOption).getAsInt() > 0) {
                                embed.addField("Niveau " + Objects.requireNonNull(lvlOption).getAsInt() + " (" + nb + ")", sorts.toString(), false);
                            } else if (Objects.requireNonNull(lvlOption).getAsInt() == 0) {
                                embed.addField("Sorts mineurs (" + nb + ")", sorts.toString(), false);
                            } else if (Objects.requireNonNull(lvlOption).getAsInt() == -1) {
                                embed.addField("Sorts de classe (" + nb + ")", sorts.toString(), false);
                            } else {
                                embed.addField("Sorts de race (" + nb + ")", sorts.toString(), false);
                            }

                            event.reply("Voici les résultats trouvés :").queue();
                            event.getChannel().sendMessageEmbeds(embed.build()).queue();
                        } else {
                            event.reply("Classe erronée ou la classe donnée n'a pas de sort de ce niveau !").queue();
                        }

                        resultSet.close();
                        statement.close();
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                } else {
                    Statement statement;
                    try {
                        statement = this.connexion.createStatement();

                        EmbedBuilder embed = new EmbedBuilder();
                        embed.setTitle("Sorts de " + Objects.requireNonNull(classeOption).getAsString());

                        for (int i = -2; i < 10; i++) {
                            query = "SELECT * FROM sortClasse JOIN sort using(id_sort) JOIN classe using(id_classe) WHERE nom_classe='" + Objects.requireNonNull(classeOption).getAsString() + "' AND niveau_sort='" + i + "'";
                            ResultSet resultSet = statement.executeQuery(query);
                            StringBuilder sortNiveau = new StringBuilder();
                            int nb = 0;
                            if (resultSet.next()) {
                                embed.setThumbnail(resultSet.getString("img_classe"));
                                do {
                                    nb++;
                                    sortNiveau.append("* ").append(resultSet.getString("nom_sort")).append("\n");
                                } while (resultSet.next());
                                if (i > 0) {
                                    embed.addField("Niveau " + i + " (" + nb + ")", sortNiveau.toString(), false);
                                } else if (i == 0) {
                                    embed.addField("Sorts mineurs (" + nb + ")", sortNiveau.toString(), false);
                                } else if (i == -1) {
                                    embed.addField("Sorts de classe (" + nb + ")", sortNiveau.toString(), false);
                                } else {
                                    embed.addField("Sorts de race (" + nb + ")", sortNiveau.toString(), false);
                                }
                            }
                        }
                        if (embed.getFields().isEmpty()) {
                            event.reply("Cette classe ne possède pas de sorts ou nom de classe incorrect !").queue();
                        } else {
                            event.reply("Voici les résultats trouvés :").queue();
                            event.getChannel().sendMessageEmbeds(embed.build()).queue();
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        }

        try {
            this.connexion.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public void onGuildReady(@NotNull GuildReadyEvent event){
        List<CommandData> commandData = new ArrayList<>();

        OptionData optionSort = new OptionData(OptionType.STRING, "nom", "Nom du sort que vous recherchez", true);
        commandData.add(Commands.slash("sort","Obtenez la fiche d'un sort à partir de son nom.").addOptions(optionSort));

        OptionData optionSpell = new OptionData(OptionType.STRING, "name", "Name of the spell you are looking for", true);
        commandData.add(Commands.slash("spell","Obtain the spell description").addOptions(optionSpell));

        commandData.add(Commands.slash("off","Éteindre le bot."));

        commandData.add(Commands.slash("ecoles","Donne les id et noms des types d'écoles."));

        OptionData optionSortClasse1 = new OptionData(OptionType.STRING, "classe", "Barbare/Barde/Clerc/Druide/Ensorceleur/Guerrier/Magicien/Moine/Paladin/Rodeur/Roublard/Sorcier)", true);
        OptionData optionSortClasse2 = new OptionData(OptionType.INTEGER, "niveau","Niveau des sorts recherché dans la classe", false);
        commandData.add(Commands.slash("sort_classe","Obtenez la liste des sorts d'une classe. Option: obtenir les sorts d'un certain niveau.").addOptions(optionSortClasse1).addOptions(optionSortClasse2));

        event.getGuild().updateCommands().addCommands(commandData).queue();

        event.getGuild().updateCommands().addCommands(commandData).queue();
    }

    private String SpellNameCorrection(String nom, Langues lg){
        if (nom.contains("'")) {
            nom = nom.replace("'", "''");
        }

        if(lg==Langues.FR) {
            StringBuilder modifName = new StringBuilder(nom);
            if (modifName.charAt(0) == 'É' || modifName.charAt(0) == 'é') {
                modifName.setCharAt(0, 'e');
            }
            return modifName.substring(0,1).toUpperCase()+modifName.substring(1).toLowerCase();
        }

        if(lg==Langues.EN){
            String[] tabSort;
            String[] tabMots = nom.split(" ");
            String nom_sort_en = "";
            if(tabMots.length==1 && tabMots[0].contains("/")){
                String[] tabMot_slash = tabMots[0].split("/");
                for (int i=0; i<tabMot_slash.length; i++) {
                    nom_sort_en = nom_sort_en.concat(tabMot_slash[i].substring(0,1).toUpperCase()+tabMot_slash[i].substring(1).toLowerCase());
                    if(i<tabMot_slash.length-1){
                        nom_sort_en = nom_sort_en.concat("/");
                    }
                }
            }
            else {
                for(int i=0; i<tabMots.length; i++) {
                    if (tabPetitsMots.contains(tabMots[i])) {
                        nom_sort_en = nom_sort_en.concat(tabMots[i].toLowerCase());
                    }
                    else {
                        nom_sort_en = nom_sort_en.concat(tabMots[i].substring(0,1).toUpperCase()+tabMots[i].substring(1).toLowerCase());
                    }

                    if(i<tabMots.length-1){
                        nom_sort_en = nom_sort_en.concat(" ");
                    }
                }
            }
            return nom_sort_en;
        }
        return null;
    }

    private void extractAndAjoutPetitsMots(){
        try {
            BufferedReader br = new BufferedReader(new FileReader("src/main/java/Assets/Database/nonCapitalizeWords.data"));
            String ligne;
            while((ligne=br.readLine())!=null){
                System.out.println("-"+ligne+"-");
                tabPetitsMots.add(ligne);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
