---
title: ''
date: 2026-03-25
layout: 'single'
# showAuthor: false
heroStyle: 'background'
showHero: true
showDate: false
showDateOnlyInArticle: false
showDateUpdated: false
showHeadingAnchors: false
showPagination: false
showReadingTime: false
showTableOfContents: true
showTaxonomies: false
showWordCount: false
showSummary: false
sharingLinks: false
showEdit: false
showViews: false
showLikes: false
layoutBackgroundHeaderSpace: false
---

<style>
    /* Scoped container to avoid theme interference */
    .cv-container {
        width: 100% !important;
        margin: 2rem 0;
        overflow-x: auto; /* Adds a scrollbar on tiny mobile screens so it doesn't break */
    }

    .academic-cv-table {
        width: 100% !important;
        max-width: 100% !important;
        margin-left: auto !important;
        margin-right: auto !important;
        border-collapse: collapse !important;
        table-layout: fixed; /* Ensures consistent column widths */
        color: inherit;
        font-size: 0.95rem;
    }

    /* Column Width Definitions */
    .col-logo { width: 15%; }
    .col-inst { width: 30%; }
    .col-pos  { width: 30%; }
    .col-date { width: 15%; }
    .col-loc  { width: 10%; }

    .academic-cv-table th, 
    .academic-cv-table td {
        padding: 15px 10px !important;
        vertical-align: middle !important;
        border-bottom: 1px solid rgba(128, 128, 128, 0.5) !important;
        text-align: center !important;
        word-wrap: break-word; /* Prevents long text from pushing the table off-screen */
    }

    .academic-cv-table th {
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-size: 0.8rem;
        opacity: 0.7;
    }

    .academic-cv-table .customEntitityLogo {
        width: 80px !important;
        height: auto !important;
        filter: grayscale(20%); /* Optional: makes logos look more "academic" */
        transition: filter 0.3s;
    }
    
    .academic-cv-table .customEntitityLogo:hover {
        filter: grayscale(0%);
    }
</style>
## Experience

<div class="cv-container">
    <table class="academic-cv-table">
        <thead>
            <tr>
                <th class="col-exp-logo">Logo</th>
                <th class="col-exp-inst">Institution</th>
                <th class="col-exp-pos">Position</th>
                <th class="col-exp-date">Dates</th>
                <th class="col-exp-loc">Location</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td rowspan="2"><img class="customEntitityLogo" src="ivb.png"/></td>
                <td rowspan="2"><strong><a href="https://www.ivb.cz/en/" target="_blank">Institute of Vertebrate Biology,<br>Czech Academy of Sciences</a></strong></td>
                <td>Post-Doctoral Researcher</td>
                <td>2024-Pres.</td>
                <td rowspan="2">Studenec, CZ</td>
            </tr>
            <tr>
                <td>Post-Doctoral Researcher</td>
                <td>2020-2024</td>
            </tr>
            <tr>
                <td rowspan="1"><img class="customEntitityLogo" src="cibio.jpg"/></td>
                <td rowspan="1"><strong><a href="https://www.cibio.up.pt/en/" target="_blank">CIBIO</a></strong></td>
                <td>Post-Doctoral Researcher</td>
                <td>2018-2020</td>
                <td rowspan="2">Vairaõ, PT</td>
            </tr>
        </tbody>
    </table>
</div>

## Education

<div class="cv-container">
    <table class="academic-cv-table">
        <thead>
            <tr>
                <th class="col-edu-logo">Logo</th>
                <th class="col-edu-inst">Institution</th>
                <th class="col-edu-deg">Degree</th>
                <th class="col-edu-year">Year</th>
                <th class="col-edu-loc">Location</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td rowspan="1"><img class="customEntitityLogo" src="uniovi.png"/></td>
                <td rowspan="1"><strong><a href="https://biologia.uniovi.es/" target="_blank">Universidad de Oviedo</a></strong></td>
                <td>PhD in BioGeoSciences</td>
                <td>2014-2018</td>
                <td>Oviedo, ES</td>
            </tr>
            <tr>
                <td rowspan="1"><img class="customEntitityLogo" src="ub.jpg"/></td>
                <td rowspan="1"><strong><a href="https://www.ub.edu/portal/web/biologia/" target="_blank">Universitat de Barcelona</a></strong></td>
                <td>MSc in Biodiversity</td>
                <td>2010-2011</td>
                <td>Barcelona, ES</td>
            </tr>
            <tr>
                <td rowspan="1"><img class="customEntitityLogo" src="upv.png"/></td>
                <td rowspan="1"><strong><a href="https://www.ehu.eus/eu/web/zientzia-teknologia-fakultatea" target="_blank">UPV / EHU</a></strong></td>
                <td>Licenciatura (degree) in Biology</td>
                <td>2005-2010</td>
                <td>Bilbao, ES</td>
            </tr>
        </tbody>
    </table>
</div>
