<?php
/**
 * Fichier d'exemple pour tester l'environnement PHP
 * Accessible à l'adresse: http://localhost:7080
 */

// Informations sur l'environnement PHP
echo "<!DOCTYPE html>";
echo "<html lang='fr'>";
echo "<head>";
echo "<meta charset='UTF-8'>";
echo "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>PHP-in-a-Box - Test Environnement</title>";
echo "<style>";
echo "body { font-family: Arial, sans-serif; margin: 40px; background: #f5f5f5; }";
echo ".container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }";
echo "h1 { color: #333; border-bottom: 2px solid #007cba; padding-bottom: 10px; }";
echo ".info { background: #e7f3ff; padding: 15px; border-radius: 5px; margin: 10px 0; }";
echo ".success { background: #d4edda; color: #155724; padding: 10px; border-radius: 5px; margin: 10px 0; }";
echo ".warning { background: #fff3cd; color: #856404; padding: 10px; border-radius: 5px; margin: 10px 0; }";
echo "code { background: #f8f9fa; padding: 2px 5px; border-radius: 3px; }";
echo "</style>";
echo "</head>";
echo "<body>";
echo "<div class='container'>";

echo "<h1>🚀 PHP-in-a-Box - Test Environnement</h1>";

// Test de base PHP
echo "<div class='success'>✅ PHP fonctionne correctement !</div>";

// Informations système
echo "<h2>📊 Informations Système</h2>";
echo "<div class='info'>";
echo "<strong>Version PHP:</strong> " . phpversion() . "<br>";
echo "<strong>Serveur:</strong> " . $_SERVER['SERVER_SOFTWARE'] . "<br>";
echo "<strong>Document Root:</strong> " . $_SERVER['DOCUMENT_ROOT'] . "<br>";
echo "<strong>Date/Heure:</strong> " . date('Y-m-d H:i:s') . "<br>";
echo "<strong>Timezone:</strong> " . date_default_timezone_get() . "<br>";
echo "</div>";

// Test des extensions
echo "<h2>🔧 Extensions PHP</h2>";
$required_extensions = ['curl', 'ldap', 'pdo', 'pdo_sqlite'];
$loaded_extensions = get_loaded_extensions();

foreach ($required_extensions as $ext) {
    if (in_array($ext, $loaded_extensions)) {
        echo "<div class='success'>✅ Extension <code>$ext</code> chargée</div>";
    } else {
        echo "<div class='warning'>⚠️ Extension <code>$ext</code> non trouvée</div>";
    }
}

// Test de la base de données SQLite
echo "<h2>🗄️ Test Base de Données SQLite</h2>";
try {
    $pdo = new PDO('sqlite::memory:');
    echo "<div class='success'>✅ Connexion SQLite réussie</div>";
    
    // Test de création de table
    $pdo->exec("CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT)");
    echo "<div class='success'>✅ Création de table réussie</div>";
    
    // Test d'insertion
    $stmt = $pdo->prepare("INSERT INTO test (name) VALUES (?)");
    $stmt->execute(['Test PHP-in-a-Box']);
    echo "<div class='success'>✅ Insertion de données réussie</div>";
    
    // Test de lecture
    $stmt = $pdo->query("SELECT * FROM test");
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "<div class='success'>✅ Lecture de données réussie: " . htmlspecialchars($result['name']) . "</div>";
    
} catch (PDOException $e) {
    echo "<div class='warning'>⚠️ Erreur SQLite: " . htmlspecialchars($e->getMessage()) . "</div>";
}

// Test de cURL
echo "<h2>🌐 Test cURL</h2>";
if (function_exists('curl_init')) {
    echo "<div class='success'>✅ Extension cURL disponible</div>";
} else {
    echo "<div class='warning'>⚠️ Extension cURL non disponible</div>";
}

// Informations sur Composer
echo "<h2>📦 Composer</h2>";
if (file_exists('../composer.json')) {
    echo "<div class='success'>✅ Fichier composer.json trouvé</div>";
    if (file_exists('../vendor/autoload.php')) {
        echo "<div class='success'>✅ Autoloader Composer disponible</div>";
    } else {
        echo "<div class='warning'>⚠️ Autoloader Composer non trouvé (exécutez <code>composer install</code>)</div>";
    }
} else {
    echo "<div class='warning'>⚠️ Fichier composer.json non trouvé</div>";
}

echo "<h2>🎯 Prochaines Étapes</h2>";
echo "<div class='info'>";
echo "<ul>";
echo "<li>Créez vos fichiers PHP dans le dossier <code>src/</code></li>";
echo "<li>Ajoutez vos dépendances avec <code>composer require package-name</code></li>";
echo "<li>Configurez votre base de données dans <code>src/</code></li>";
echo "<li>Personnalisez <code>php.ini</code> selon vos besoins</li>";
echo "</ul>";
echo "</div>";

echo "</div>";
echo "</body>";
echo "</html>";
?> 